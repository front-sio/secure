import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secure/common/widgets/loader/loader.dart';
import 'package:secure/data/repositories/authentication/authentication_repository.dart';
import 'package:secure/features/authentication/controllers/user/user_controller.dart';
import 'package:secure/utils/network/network_manager.dart';
import 'package:secure/utils/popups/full_screen_loader.dart';

import '../../screens/signup/otp.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository.instance;

  static LoginController get instance => Get.find();
  final userController = Get.put(UserController());

  
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();

  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose TextEditingControllers
    phoneNumber.dispose();
    super.dispose();
  }

  void phoneAuthentication(String phoneNumber) async {
      // Remove leading '0' from the phone number
      String cleanedPhoneNumber = phoneNumber.startsWith('0') ? phoneNumber.substring(1) : phoneNumber;
    
      // Concatenate the country code to the phone number
      String formattedPhoneNumber = '+255$cleanedPhoneNumber';
    

      try {
        if (!signupFormKey.currentState!.validate()) {
          SeFullScreenLoader.stopLoading();
          return;
        }

        // Call the repository method to verify the formatted phone number
        await _repository.phoneAuthentication(formattedPhoneNumber);
        // Navigate to OTP screen after successful verification
        Get.to(() => OTPVerificationScreen(phoneNumber: formattedPhoneNumber));
      } catch (e) {
        // Handle error
        print('Error verifying phone number: $e');
      }
    }


  void signInWithSmsCode(BuildContext context, String smsCode, String verificationId) async {
    try {
      // Call the repository method to sign in with SMS code
      _repository.signInWithSmsCode(smsCode, verificationId);
      // Handle successful sign-in
    } catch (e) {
      // Handle error
      print('Error signing in with SMS code: $e');
    }
  }

  Future<void> googleSignIn () async {
    try {
      // start loading
      SeFullScreenLoader.openLoadingDialog('Loggin you in...', 'assests/animation/waiting-7579_256.gif');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        SeFullScreenLoader.stopLoading();
        return;
      }

      // google athentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      SeFullScreenLoader.stopLoading();

    } catch (e){
      SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:secure/features/authentication/screens/signup/signup_screen.dart';
import 'package:secure/utils/constants/size.dart';
import 'package:secure/utils/helpers/helper_functions.dart';

import '../../../../../navigation_bar.dart';

class SeLoginForm extends StatelessWidget {
  const SeLoginForm({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: SecuriteSize.spaceBtwSection),
      child: Column(
        children: [
          // email
          TextFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct), labelText: 'E-mail'),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check), 
              labelText: 'Password', 
              suffixIcon: Icon(Iconsax.eye_slash),
              ),
          ),
          const SizedBox(height: 16 / 2,),
          // check remember me and forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            // remember me
            Row(children: [
              Checkbox(value: true, onChanged: (value){}),
              const Text('Remember Me')
            ],),
            // forget password
            TextButton(onPressed: () => Get.to(()=> const ForgetPassword()), child: const Text('Forget Password?'))
          ],),
          const SizedBox(height: SecuriteSize.spaceBtwSection),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(()=> const NavigationMenu()), 
              child: const Text('Sign In'),
              ),
          ),
          const SizedBox(height: SecuriteSize.spaceBtwItem),
           SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignUpScreen()), 
              child: Text('Create Account', style: TextStyle(color: dark ? Colors.white: Colors.black),),
              ),
          ),    
        ],
      ),
    ),
    );
  }
}
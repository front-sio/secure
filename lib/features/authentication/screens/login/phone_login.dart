import 'package:flutter/material.dart';
import 'package:secure/common/styles/spacing_styles.dart';
import 'package:secure/features/authentication/screens/login/widgets/login_header.dart';
import 'package:secure/common/widgets/login_signup/login_social_button.dart';
import 'package:secure/common/widgets/login_signup/divider_form.dart';
import 'package:secure/features/authentication/screens/login/widgets/phone_login_form_widget.dart';
import 'package:secure/utils/constants/size.dart';


class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  SecuriteSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo, title & subtitle
              SeLoginHeader(),
              // form
              SePhoneLoginForm(),

              // Divider
              SeDivider(text: 'or sign in with',),
              SizedBox(height: SecuriteSize.spaceBtwSection,),
              // Footer
              SeSocialButtons(),
            ],
          ),
          ),
      ),
    );
  }
}







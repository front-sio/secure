import 'package:flutter/material.dart';
import 'package:secure/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:secure/utils/constants/size.dart';
import 'package:secure/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SecuriteDeviceUtils.getAppBarHeight(),
      right: SecuriteSize.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(), 
        child: const Text('Skip'),
      ),
    );
  }
}
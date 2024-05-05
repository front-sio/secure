import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure/bindings/general_bindings.dart';
import 'package:secure/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:secure/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SecuriteAppTheme.lightTheme,
      darkTheme: SecuriteAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
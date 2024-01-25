import 'package:ecom3/bindings/general_bindings.dart';
import 'package:ecom3/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecom3/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: HColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: HColors.white,
          ),
        ),
      ),
    );
  }
}

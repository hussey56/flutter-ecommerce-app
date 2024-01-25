import 'package:ecom3/common/styles/spacing_style.dart';
import 'package:ecom3/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecom3/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo , title & Sub title
              LoginHeader(dark: dark),
              // Form
              const LoginForm(),
// Divider
              FormDivider(dividerText: HTexts.orSignInwith.capitalize!,),
              const SizedBox(
                height: HSizes.spaceBtwSection,
              ),
              // Footer
const HSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}








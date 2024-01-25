import 'package:ecom3/common/widgets/login_signup/form_divider.dart';
import 'package:ecom3/common/widgets/login_signup/social_button.dart';
import 'package:ecom3/features/authentication/screens/signup/widget/signup_form.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                HTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSection,
              ),

              /// Form
           const HSignupForm(),
              const SizedBox(height: HSizes.spaceBtwSection,),


              // Divider
FormDivider(dividerText: HTexts.orSignUpwith.capitalize!),
              const SizedBox(height: HSizes.spaceBtwSection,),

              // Social Buttons
              const HSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:ecom3/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecom3/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecom3/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecom3/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecom3/features/authentication/screens/onboarding/widgets/skip_button.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(onBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: HImages.onBoardingImage1,
                title: HTexts.onBoardingTitle1,
                subtitle: HTexts.onBoardingSubTitle1,
              ),
              onBoardingPage(
                image: HImages.onBoardingImage2,
                title: HTexts.onBoardingTitle2,
                subtitle: HTexts.onBoardingSubTitle2,
              ),
              onBoardingPage(
                image: HImages.onBoardingImage3,
                title: HTexts.onBoardingTitle3,
                subtitle: HTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const SkipButton(),
          // Dot Navigation SmoothPage Indicator
          const OnBoardingDotNavigation(),
          // Circular button
        const  OnBoardingCircularButton()
        ],
      ),
    );
  }
}



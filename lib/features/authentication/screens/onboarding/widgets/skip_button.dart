import 'package:ecom3/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: HDeviceUtils.getAppBarHeight(),
      right: HSizes.defaultSpace,
      child: TextButton(
        onPressed: () => onBoardingController.instance.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
import 'dart:async';

import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/common/widgets/success_screen/success_screen.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendVerficationEmail();
    setTimerforAutoRedirect();
    super.onInit();
  }

  sendVerficationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      HLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please Check your inbox and verify your email");
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  setTimerforAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: HImages.staticSuccessIllustration,
            title: HTexts.yourAccountCreatedTitle,
            subTitle: HTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }
  
  checkEmailVerificationStatus()async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
          image: HImages.staticSuccessIllustration,
          title: HTexts.yourAccountCreatedTitle,
          subTitle: HTexts.yourAccountCreatedSubTitle,
          onPressed: () =>
              AuthenticationRepository.instance.screenRedirect()));
    }
  }
}

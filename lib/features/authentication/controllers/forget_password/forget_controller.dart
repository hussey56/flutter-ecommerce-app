import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/helpers/network_manger.dart';
import 'package:ecom3/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
// Start Loading
      HFullScreenLoader.openLoadingDialog(
          'Processing your request...', HImages.staticSuccessIllustration);
      // Check internet coneectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }
// send email for reset password
      await AuthenticationRepository.instance
          .sendForgetPassword(email.text.trim());

      // Remove Loader
      HFullScreenLoader.stopLoading();

      // Show Success Screen
      HLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password.');

      // Redirect
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      HFullScreenLoader.stopLoading();

      // Show Success Screen
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

// Resend Reset Password Email
  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
          'Processing your request...', HImages.registerAnimation);
      // Check internet coneectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

// send email for reset password
      await AuthenticationRepository.instance.sendForgetPassword(email);

      // Remove Loader
      HFullScreenLoader.stopLoading();

      // Show Success Screen
      HLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password.');

      // Redirect
      Get.to(() => ResetPassword(
            email: email,
          ));
    } catch (e) {
      HFullScreenLoader.stopLoading();

      // Show Success Screen
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

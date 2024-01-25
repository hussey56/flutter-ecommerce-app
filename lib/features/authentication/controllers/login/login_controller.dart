import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/myloaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manger.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  }

  Future<void> loginwithemailpassword() async {
    try {
      // start loading
      HFullScreenLoader.openLoadingDialog(
          'Logging you in...', HImages.registerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance
          .loginwithEmailAndPassword(email.text.trim(), password.text.trim());

      HFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      HFullScreenLoader.stopLoading();
// show genric error
      HLoaders.errorSnackBar(title: "OH Snap!", message: e.toString());
    }
  }

  Future<void> GoogleLogin() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          'Logging you in...', HImages.registerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }
      final userCredentails =
          await AuthenticationRepository.instance.loginwithGoogle();

      await userController.saveUserRecord(userCredentails);

      HFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      HFullScreenLoader.stopLoading();
// show genric error
      HLoaders.errorSnackBar(title: "OH Snap!", message: e.toString());
    }
  }
}

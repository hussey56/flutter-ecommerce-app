import 'package:ecom3/data/repositories/user/user_repository.dart';
import 'package:ecom3/features/personalization/controllers/user_controller.dart';
import 'package:ecom3/features/personalization/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/myloaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manger.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.insatnce;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstname;
    lastName.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      HFullScreenLoader.openLoadingDialog(
          'Updating you in...', HImages.registerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!updateNameFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateUserSingleRecord(name);

      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();

      HFullScreenLoader.stopLoading();

      HLoaders.successSnackBar(
          title: "Congratulations", message: "Your name has been updated");

      Get.off(()=>const ProfileScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();
// show genric error
      HLoaders.errorSnackBar(title: "OH Snap!", message: e.toString());
    }
  }
}

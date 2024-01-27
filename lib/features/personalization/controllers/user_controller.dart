import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/data/repositories/user/user_repository.dart';
import 'package:ecom3/features/authentication/models/user_model.dart';
import 'package:ecom3/features/authentication/screens/login/login.dart';
import 'package:ecom3/features/personalization/screens/profile/widgets/reauthenticate_user.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manger.dart';

class UserController extends GetxController {
  static UserController get insatnce => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final imageUploader = false.obs;
  final verifyEmail = TextEditingController();
  final verfiyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  //fetch user details
  Future<void> fetchUser() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // save user data
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUser();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username =
              UserModel.generateUsername(userCredential.user!.displayName);

          final user = UserModel(
              email: userCredential.user!.email ?? '',
              id: userCredential.user!.uid,
              username: username,
              firstname: nameParts[0],
              lastname:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              profilePicture: userCredential.user!.photoURL ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '');

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      HLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrongwhile saving your information. You can resave your data in the profile section.");
    }
  }

  // delete dialog
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(HSizes.md),
        title: "Delete Account",
        middleText:
            "Are you sure you want to delete your account permenently? This action is not reversible and all of your data will be removed permanently.",
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            onPressed: () async => deleteUserAccount(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: HSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.context!).pop(),
            child: const Text('Cancel')));
  }

  // delete user account
  void deleteUserAccount() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          "Processing...", HImages.registerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // reverify auth email
        if (provider == "google.com") {
          await auth.loginwithGoogle();
          await auth.deleteUser();
          HFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else {
          HFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUser());
        }
      }
    } catch (e) {
      HFullScreenLoader.stopLoading();
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

// reauthenticate before deleting
  Future<void> reAuthenticateEmailPassword() async {
    try {
      // start loading
      HFullScreenLoader.openLoadingDialog(
          'Processing...', HImages.registerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!reAuthFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reauthenticateUser(
          verifyEmail.text.trim(), verfiyPassword.text.trim());
      await AuthenticationRepository.instance.deleteUser();
      HFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // upload images
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploader.value = true;
        final imageUrl =
            await userRepository.imageUpload("Users/Images/Profile/", image);

        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateUserSingleRecord(json);

        user.value.profilePicture = imageUrl;

        user.refresh();
        HLoaders.successSnackBar(
            title: "Congratulations",
            message: "Your Profile Image has been updated");
      }
    } catch (e) {
      HLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Something went wrong: $e");
    } finally {
      imageUploader.value = false;
    }
  }
}

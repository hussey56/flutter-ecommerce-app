import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/data/repositories/authentication/user_repository.dart';
import 'package:ecom3/features/authentication/models/user_model.dart';
import 'package:ecom3/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/helpers/network_manger.dart';
import 'package:ecom3/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variables
  final hidepassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // start loading
      HFullScreenLoader.openLoadingDialog(
          'We are processing your information...', HImages.registerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        HFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormkey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        HLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                'In order to create account, you must have to read and accept the Privacu Policy & '
                'Term of Use');
        return;
      }

      // register user and save data in firebase
      final userCredentials = await AuthenticationRepository.instance
          .registerwithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // save authenticated user in the firebase firestore
      final newUser = UserModel(
          email: email.text.trim(),
          id: userCredentials.user!.uid,
          username: username.text.trim(),
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          profilePicture: "",
          phoneNumber: phone.text);

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      HFullScreenLoader.stopLoading();
      // show success message
      HLoaders.successSnackBar(
          title: "Congratulations",
          message: 'Your account has been created! Verify email to continue');
      //move to verify screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      HFullScreenLoader.stopLoading();
// show genric error
      HLoaders.errorSnackBar(title: "OH Snap!", message: e.toString());
    }
  }
}

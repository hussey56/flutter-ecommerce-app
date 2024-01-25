import 'package:ecom3/data/repositories/authentication/user_repository.dart';
import 'package:ecom3/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get insatnce => Get.find();
 final userRepository =Get.put(UserRepository());
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    if (userCredential != null) {
      final nameParts = UserModel.nameParts(
          userCredential.user!.displayName ?? '');
      final username = UserModel.generateUsername(
          userCredential.user!.displayName);

      final user = UserModel(email: userCredential.user!.email ?? '',
          id: userCredential.user!.uid,
          username: username,
          firstname: nameParts[0],
          lastname: nameParts.length > 1?nameParts.sublist(1).join(' '):'',
          profilePicture: userCredential.user!.photoURL??'',
          phoneNumber: userCredential.user!.phoneNumber??'');

      await userRepository.saveUserRecord(user);

    }
  }
}
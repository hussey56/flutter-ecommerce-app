import 'package:ecom3/bottom_navigation_bar.dart';
import 'package:ecom3/data/repositories/user/user_repository.dart';
import 'package:ecom3/features/authentication/screens/login/login.dart';
import 'package:ecom3/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom3/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom3/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecom3/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom3/utils/exceptions/format_exceptions.dart';
import 'package:ecom3/utils/exceptions/platform_exceptions.dart';
import 'package:ecom3/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

//  variable
  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;

  // get authenticated user data
  User? get authUser => auth.currentUser;

// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

// function to show relevant screen
  void screenRedirect() async {
    final user = auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await HLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const onBoardingScreen());
    }
  }

/*------------------------- Email & password Sign in-----------------------------*/
// Email Authentication - signin
  Future<UserCredential> loginwithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// Email Authentication - Register
  Future<UserCredential> registerwithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Google Authentication Problem';
    }
  }

// ReAuthenticate
  Future<void> reauthenticateUser(String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      await auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Logout';
    }
  }

// email verification - mail verification
  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Google Authentication Problem';
    }
  }

// email verification - forget password
  Future<void> sendForgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Forget Password Problem';
    }
  }

/*------------------------- Social Media Sign in-----------------------------*/
// Google
  Future<UserCredential?> loginwithGoogle() async {
    try {
      // trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // once sign in return the user credentail
      return await auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }

// Facebook

/*------------------------- Signout-----------------------------*/
// Sign out
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await auth.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Logout';
    }
  }

// delete user
  Future<void> deleteUser() async {
    try {
      await UserRepository.instance.RemoveUserRecord(auth.currentUser!.uid);
      await auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Logout';
    }
  }
}

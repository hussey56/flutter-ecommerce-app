import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/features/authentication/models/user_model.dart';
import 'package:ecom3/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom3/utils/exceptions/format_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // save user details
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // fetch user details
  Future<UserModel> fetchUserRecord() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //update user data
  Future<void> updateUserRecord(UserModel userupdated) async {
    try {
      await _db
          .collection("Users")
          .doc(userupdated.id)
          .update(userupdated.toJson());
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  //update user specific data
  Future<void> updateUserSingleRecord(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(
          AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Remove User data from firestore
  Future<void> RemoveUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // upload any image
Future<String> imageUpload(String path,XFile image) async {
  try {
   final ref = FirebaseStorage.instance.ref(path).child(image.name);
   await ref.putFile(File(image.path));
final url = await ref.getDownloadURL();
return url;
  } on FirebaseAuthException catch (e) {
    throw HFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw HFirebaseExceptions(e.code).message;
  } on FormatException catch (_) {
    throw const HFormatExceptions();
  } on PlatformException catch (e) {
    throw e;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}
}

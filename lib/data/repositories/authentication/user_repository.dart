import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/authentication/models/user_model.dart';
import 'package:ecom3/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom3/utils/exceptions/format_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (e) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}

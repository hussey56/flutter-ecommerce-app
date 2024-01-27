import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom3/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw Exception(
          'Something went wrong. Please try again later'); // Rethrow a descriptive error
    }
  }
// Get Sub CaTEGORIES

// uPLOAD Categories to Firebase
}

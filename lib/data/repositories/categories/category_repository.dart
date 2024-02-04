import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom3/utils/exceptions/platform_exceptions.dart';
import 'package:ecom3/utils/helpers/firebase_storage_services.dart';
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
      throw 'Something went wrong. Please try again later'; // Rethrow a descriptive error
    }
  }

// Get Sub CaTEGORIES
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where("ParentID", isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((e) => CategoryModel.fromSnapshot(e))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later'; // Rethrow a descriptive error
    }
  }

// UPLOAD Dummy data Categories to Firebase

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the categories along with their images
      final storage = Get.put(HFirebaseStorageServies());
      // loop through each category
      for (var category in categories) {
        // get imagedata link from the local assets
        final file = await storage.getImageDatafromAssets(category.image);
        // upload image and get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);
        // assign url to category
        category.image = url;
        // store data to firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later'; // Rethrow a descriptive error
    }
  }
}

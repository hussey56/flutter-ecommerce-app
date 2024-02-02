import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later ${e.toString()}'; // Rethrow a descriptive error
    }
  }

  Future<List<BrandModel>> getBrandsForCategories(String categoryId) async {
    try {
      // query to get all documents where categoryiId matches the provide the categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection("BrandCategory")
          .where("categoryId", isEqualTo: categoryId)
          .get();
      // extract brandIds from the documents
      List<String> brandIds =
          brandCategoryQuery.docs.map((e) => e['brandId'] as String).toList();
      // getting brand query
      final brandQuery = await _db
          .collection("Brands")
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      //extract from json and convert it
      List<BrandModel> brands =
          brandQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later ${e.toString()}'; // Rethrow a descriptive error
    }
  }
}

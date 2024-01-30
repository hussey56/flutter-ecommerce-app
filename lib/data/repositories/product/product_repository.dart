import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/firebase_storage_services.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

// get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

//upload dummy data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(HFirebaseStorageServies());
      for (var product in products) {
        // get thumbnail image from assets
        final thumbnail =
            await storage.getImageDatafromAssets(product.thumbnail);
        // upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
        product.thumbnail = url;
// upload brand image to firebase
        final brandimage =
            await storage.getImageDatafromAssets(product.brand!.image);

        // upload image and get its url
        final brandurl = await storage.uploadImageData(
            'Products/Brands', brandimage, product.brand!.name.toString());

        product.brand!.image = brandurl;

        // upload product images from assets to firebase and get url save in the model
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageList = [];
          for (var image in product.images!) {
            final img = await storage.getImageDatafromAssets(image);
            final url =
                await storage.uploadImageData("Products/Images", img, image);
            imageList.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageList);
        }
        // product variations
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final img = await storage.getImageDatafromAssets(variation.image);
            final url = await storage.uploadImageData(
                "Products/Images", img, variation.image);

            variation.image = url;
          }
        }
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}

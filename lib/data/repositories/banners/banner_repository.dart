import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/shop/models/banner_model.dart';
import 'package:ecom3/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/firebase_storage_services.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

// Get all banners
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final result = await _db
          .collection("Banners")
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw HFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const HFormatExceptions();
    } on PlatformException catch (e) {
      throw HPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later'; // Rethrow a descriptive error
    }
  }

// upload banners

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // upload all the banners along with their images
      final storage = Get.put(HFirebaseStorageServies());
      // loop through each banner
      for (var banner in banners) {
        // get image data link from the local assets
        final file = await storage.getImageDatafromAssets(banner.imageUrl);
        // upload image and get its url
        final url =
            await storage.uploadImageData('Banners', file, banner.imageUrl);
        // assign url to category
        banner.imageUrl = url;
        // store data to firestore
        await _db.collection("Banners").add(banner.toJson());
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

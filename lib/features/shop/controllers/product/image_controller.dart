import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();
  RxString selectedImage = "".obs;

  List<String> getallimages(ProductModel product) {
// Get all images from the product model
    Set<String> images = {};
    // load thumnail image
    images.add(product.thumbnail);
    // assign thumnail image as selected image
    selectedImage.value = product.thumbnail;

    // get all images from the product images array into the image list
    if (product.images != null) {
      images.addAll(product.images!);
    }
    // get product variation image sinto image list
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((e) => e.image));
    }
    return images.toList();
  }

  void getEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: HSizes.defaultSpace * 2,
                        horizontal: HSizes.defaultSpace),
                    child: CachedNetworkImage(
                      imageUrl: image,
                    ),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: const Text('Close'),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}

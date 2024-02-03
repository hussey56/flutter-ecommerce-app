import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom3/common/widgets/product/favorite_icon/favorite_icon.dart';
import 'package:ecom3/features/shop/controllers/product/image_controller.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getallimages(product);
    return HCurvedEdgeWidget(
      child: Container(
        color: dark ? HColors.darkerGrey : HColors.light,
        child: Stack(
          children: [
            // main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedImage.value;
                  return InkWell(
                    onTap: ()=>controller.getEnlargeImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: HColors.primary,
                      ),
                    ),
                  );
                })),
              ),
            ),

            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: HSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(
                    (){
                      final imageSelected = controller.selectedImage.value == images[index];
                      return RoundedImage(
                        isNetworkImage: true,
                      imageUrl: images[index],
                      width: 80,
                      backgroundColor: dark ? HColors.dark : HColors.white,
                      border: Border.all(color: imageSelected? HColors.primary:Colors.transparent),
                      padding: const EdgeInsets.all(HSizes.sm),
                        onPressed: ()=>controller.selectedImage.value =images[index],
                    );}
                  ),
                ),
              ),
            ),

            // App bar
             HAppBar(
              showBackArrow: true,
              actions: [
             FavoriteIcon(productId: product.id,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

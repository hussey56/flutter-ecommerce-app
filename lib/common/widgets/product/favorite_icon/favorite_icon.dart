import 'package:ecom3/common/widgets/icons/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favorite_controller.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.productId});
final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(
      ()=>HCircularIcon(
          icon: controller.isFavorite(productId)? Iconsax.heart5:Iconsax.heart,
          color:controller.isFavorite(productId)? Colors.red:null,
        onPressed: ()=>controller.toggleFavoriteProduct(productId),
        )
    );
  }
}

import 'package:ecom3/common/styles/shadows.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/images/rounded_image.dart';
import 'package:ecom3/common/widgets/product/cart/add_to_cart_button.dart';
import 'package:ecom3/common/widgets/product/favorite_icon/favorite_icon.dart';
import 'package:ecom3/common/widgets/text/brand_title_with_verified.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/common/widgets/text/product_title.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/features/shop/screens/product_details/product_detail.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/enum.dart';
import '../../icons/circular_icon.dart';

class HProductCardHorizontal extends StatelessWidget {
  const HProductCardHorizontal({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
    controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product,)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [HShadowStyle.horizontalProductShadow],
          borderRadius: BorderRadius.circular(HSizes.productImageRadius),
          color: dark ? HColors.darkerGrey : HColors.softGrey,
        ),
        child: Row(
          children: [
            // Thumbnail
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(HSizes.sm),
              backgroudColor: dark ? HColors.dark : HColors.light,
              child:  Stack(
                  // Thumbnail image
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: RoundedImage(
                        imageUrl: product.thumbnail,
                        ApplyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),

                    if(salePercentage != null)
                      Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: HSizes.sm,
                        backgroudColor: HColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: HSizes.sm, vertical: HSizes.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: HColors.black),
                        ),
                      ),
                    ),

                    // Favorite Button
                     Positioned(
                        top: 0,
                        right: 0,
                        child:FavoriteIcon(productId: product.id,))
                  ]
              ),
            ),
            // Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: HSizes.sm,left: HSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        ProductTitle(title: product.title,smallSize: true,),
                        SizedBox(height: HSizes.spaceBtwItems/2,),
                        BrandTitlewithVerifiedIcon(title: product.brand!.name)
                      ],
                    ),
Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Price
                        Flexible(
                          child: Column(
                            children: [
                              if (product.productType ==
                                  ProductType.single.toString() &&
                                  product.salePrice > 0)
                                Padding(
                                    padding: EdgeInsets.only(left: HSizes.sm),
                                    child: Text(
                                      product.price.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(
                                          decoration: TextDecoration.lineThrough),
                                    )),
                              Padding(
                                padding: EdgeInsets.only(left: HSizes.sm),
                                child: ProductPriceText(
                                  price: controller.getProductPrice(product),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ProductAddtoCartButton(product: product)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

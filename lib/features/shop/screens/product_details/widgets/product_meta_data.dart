import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/images/circular_image.dart';
import 'package:ecom3/common/widgets/text/brand_title_with_verified.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/features/shop/controllers/product/product_controller.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/product_title.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            RoundedContainer(
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
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),

            //Price
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
            Text(
              '\$${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
              const SizedBox(
              width: HSizes.spaceBtwItems,
            ),
             ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),

        // Title
         ProductTitle(
          title: product.title,
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),

        // Stock Status
        Row(children: [
          const ProductTitle(
            title: 'Stock',
          ),
          const SizedBox(
            width: HSizes.spaceBtwItems,
          ),
          Text(
            controller.getStockStatus(product.stock),
            style: Theme.of(context).textTheme.titleMedium,
          )
        ]),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),
        // Brand
        Row(
          children: [
            HCircularImage(
              image: product.brand!.image,
              width: 32,
              height: 32,
              isNetworkImage: true,
              overlayColor: dark ? HColors.white : HColors.black,
            ),
             BrandTitlewithVerifiedIcon(
              title: product.brand != null ?product.brand!.name:'',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

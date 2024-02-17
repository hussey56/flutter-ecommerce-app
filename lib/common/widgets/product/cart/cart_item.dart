import 'package:ecom3/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verified.dart';
import '../../text/product_title.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartitem,
  });

  final CartItemModel cartitem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        RoundedImage(
          imageUrl: cartitem.image ?? '',
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(HSizes.md),
          backgroundColor: dark ? HColors.darkerGrey : HColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(
          width: HSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitlewithVerifiedIcon(
                title: cartitem.brandName ?? '',
              ),
              Flexible(
                child: ProductTitle(
                  title: cartitem.title,
                  maxLines: 1,
                ),
              ),

              //Attributes
              Text.rich(TextSpan(
                children: (cartitem.selectedVariation ?? {})
                    .entries
                    .map(
                      (e) => TextSpan(
                        children: [
                          TextSpan(
                              text: ' ${e.key}',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: ' ${e.value}',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    )
                    .toList(),
              ))
            ],
          ),
        ),
      ],
    );
  }
}

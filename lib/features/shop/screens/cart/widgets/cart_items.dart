import 'package:flutter/material.dart';

import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/text/price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemove = true});
final bool showAddRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: HSizes.spaceBtwSection,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          CartItem(),
          if(showAddRemove) const SizedBox(
            height: HSizes.spaceBtwItems,
          ),
          if(showAddRemove) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  // Add Remove Buttons
                  ProductQuantitywithAddandRemove(),
                ],
              ),
              ProductPriceText(price: '256')
            ],
          )
        ],
      ),
    );
  }
}

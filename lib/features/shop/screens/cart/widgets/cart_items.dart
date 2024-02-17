import 'package:ecom3/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/text/price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemove = true});
final bool showAddRemove;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () {
           return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) =>
            const SizedBox(
              height: HSizes.spaceBtwSection,
            ),
            itemCount: controller.cartitems.length,
            itemBuilder: (_, index) =>
                Obx((){
                  final item = controller.cartitems[index];
                  return Column(
                  children: [
                    CartItem(cartitem:item),
                    if(showAddRemove) const SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),
                    if(showAddRemove)  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 70,
                            ),
                            // Add Remove Buttons
                            ProductQuantitywithAddandRemove(
                              add:()=>controller.addOnetoCart(item),
                              remove: ()=>controller.removeOnetoCart(item) ,
                              quantity: item.quantity,
                            ),
                          ],
                        ),
                        ProductPriceText(price: (item.price*item.quantity).toStringAsFixed(1))
                      ],
                    )
                  ],
                );})
          );
        });
  }
}

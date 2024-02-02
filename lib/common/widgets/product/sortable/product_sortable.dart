import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/shop/controllers/all_products_controller.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/gridview_layout.dart';
import '../product_cards/product_card_vertical.dart';
class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key, required this.products,
  });
final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          value: controller.selectedSortOption.value,
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
          ]
              .map((option) => DropdownMenuItem(
            child: Text(option),
            value: option,
          ))
              .toList(),
        ),
        const SizedBox(
          height: HSizes.spaceBtwSection,
        ),

        // Product
        Obx(
    ()=> GridViewLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>  HProductCardVertical(product: controller.products[index],)),
        )
      ],
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
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
    return Column(
      children: [
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
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
        GridViewLayout(
            itemCount: products.length,
            itemBuilder: (_, index) =>  HProductCardVertical(product: products[index],))
      ],
    );
  }
}
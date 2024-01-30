import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          children: [
            // Brands
            const BrandShowcase(
              images: [HImages.product4, HImages.product5, HImages.product1],
            ),
            const SizedBox(
              height: HSizes.spaceBtwItems,
            ),
            // Products
            HSectionHeading(
              title: 'You might like',
              onPressed: () {},
            ),
            const SizedBox(
              height: HSizes.spaceBtwItems,
            ),
            GridViewLayout(
                itemCount: 4, itemBuilder: (_, index) =>  HProductCardVertical(product: ProductModel.empty(),)),
            const SizedBox(
              height: HSizes.spaceBtwSection,
            ),

          ],
        ),
      ),
    ]
    );
  }
}

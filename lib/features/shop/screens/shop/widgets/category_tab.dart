import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecom3/common/widgets/shimmer/vertical_shimmer_loader.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/controllers/category_controller.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/features/shop/screens/all_products/allproducts.dart';
import 'package:ecom3/features/shop/screens/shop/widgets/category_brand.dart';
import 'package:ecom3/utils/dummy/dummy.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brand/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(HSizes.defaultSpace),
            child: Column(
              children: [
                // Brands
                CategoryBrands(category: category),
                const SizedBox(
                  height: HSizes.spaceBtwItems,
                ),
                // Products
                FutureBuilder(
                    future:
                        controller.getCategoryProduct(categoryId: category.id),
                    builder: (context, snapshot) {
                      final response =
                          HCloudHelperFuction.checkMultipleRecordState(
                              snapshot: snapshot,
                              loader: const HVerticalProductShimmer());
                      if (response != null) return response;
                      final products = snapshot.data!;
                      return Column(
                        children: [
                          HSectionHeading(
                            title: 'You might like',
                            onPressed: () {
                              Get.to(() => AllProducts(
                                    title: category.name,
                                    futureMethod: controller.getCategoryProduct(
                                        categoryId: category.id, limit: -1),
                                  ));
                            },
                          ),
                          const SizedBox(
                            height: HSizes.spaceBtwItems,
                          ),
                          GridViewLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => HProductCardVertical(
                                    product: products[index],
                                  )),
                        ],
                      );
                    }),
                const SizedBox(
                  height: HSizes.spaceBtwSection,
                ),
              ],
            ),
          ),
        ]);
  }
}

import 'package:ecom3/common/widgets/images/rounded_image.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:ecom3/common/widgets/shimmer/horizontal_shimmer_loader.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/screens/all_products/allproducts.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/dummy/dummy.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../controllers/category_controller.dart';
import '../../models/category_model.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: HAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              RoundedImage(
                imageUrl: HImages.promo1,
                width: double.infinity,
                ApplyImageRadius: true,
              ),
              SizedBox(
                height: HSizes.spaceBtwSection,
              ),
              FutureBuilder(
                  future: controller.getSubCategoryProduct(category.id),
                  builder: (context, snapshot) {
                    const loader = HorizontalProductShimmer();
                    final widget = HCloudHelperFuction.checkMultipleRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final subcategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subcategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subcategory = subcategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProduct(categoryId: subcategory.id),
                          builder: (context, snapshot) {
                            const loader = HorizontalProductShimmer();
                            final widget = HCloudHelperFuction.checkMultipleRecordState(
                                snapshot: snapshot, loader: loader);
                            if (widget != null) return widget;

                            final products = snapshot.data!;
                            return Column(
                              children: [
                                HSectionHeading(
                                  title: subcategory.name,
                                  onPressed: () {
                                    Get.to(() => AllProducts(
                                          title: subcategory.name,
                                          futureMethod:
                                              controller.getCategoryProduct(
                                                  categoryId: subcategory.id,limit: -1),
                                        ));
                                  },
                                ),
                                const SizedBox(
                                  height: HSizes.spaceBtwItems / 2,
                                ),
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: HSizes.spaceBtwItems,
                                          ),
                                      itemCount: products.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          HProductCardHorizontal(
                                            product: products[index],
                                          )),
                                )
                              ],
                            );
                          }
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

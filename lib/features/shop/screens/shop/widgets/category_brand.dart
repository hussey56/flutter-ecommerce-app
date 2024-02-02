import 'package:ecom3/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecom3/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecom3/features/shop/controllers/brand_controller.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_showcase.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getCategoryBrands(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ListTileShimmer(),
              SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              BoxesShimmer(),
              SizedBox(
                height: HSizes.spaceBtwItems,
              ),
            ],
          );
          final widget = HCloudHelperFuction.checkMultipleRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;
          final brands = snapshot.data!;

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandsProduct(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final widget =
                          HCloudHelperFuction.checkMultipleRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return BrandShowcase(
                        images: products.map((e) => e.thumbnail).toList(),
                        brands: brand,
                      );
                    });
              });
        });
  }
}

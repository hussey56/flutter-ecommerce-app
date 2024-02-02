import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/product/sortable/product_sortable.dart';
import 'package:ecom3/common/widgets/shimmer/vertical_shimmer_loader.dart';
import 'package:ecom3/features/shop/controllers/brand_controller.dart';
import 'package:ecom3/features/shop/models/brand_model.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brand/brand_card.dart';
class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: HAppBar(title: Text(brand.name),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
            //  Brand Details
              BrandCard(showBorder: true,brand:brand,),
              SizedBox(height: HSizes.spaceBtwSection,),
              FutureBuilder(
                future: controller.getBrandsProduct(brandId:brand.id),
                builder: (context, snapshot) {
                  const loader = HVerticalProductShimmer();
                  final widget = HCloudHelperFuction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null)return widget;
                  final brandProducts = snapshot.data!;
                  return SortableProducts(products:brandProducts,);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

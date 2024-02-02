import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/brand/brand_card.dart';
import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/product/sortable/product_sortable.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/controllers/brand_controller.dart';
import 'package:ecom3/features/shop/models/brand_model.dart';
import 'package:ecom3/features/shop/screens/brands/brand_products.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmer/brand_shimmer.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: HAppBar(
        title: Text("Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              HSectionHeading(
                title: "Brands",
                showActionButton: false,
              ),
              SizedBox(
                height: HSizes.spaceBtwItems,
              ),

              Obx(
                    () {
                  if (brandController.isLoading.value)
                    return const BrandShimmer();
                  if (brandController.allBrands.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: Theme.of(context).textTheme.bodyMedium!
                            .apply(color: Colors.white),
                      ),
                    );
                  }

                  return GridViewLayout(
                      itemCount: brandController.allBrands.length,
                      mainaxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return
                          BrandCard(
                              showBorder: false,
                              brand:brand,
                            onTap: ()=>Get.to(()=>BrandProducts(brand: brand,)),
                          );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

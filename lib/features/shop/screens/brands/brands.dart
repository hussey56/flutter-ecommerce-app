import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/brand/brand_card.dart';
import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/product/sortable/product_sortable.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/screens/brands/brand_products.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              GridViewLayout(
                  itemCount: 5,
                  mainaxisExtent: 80,
                  itemBuilder: (context, index) =>BrandCard(
                        showBorder: true,
                        onTap: () {
                          Get.to(() => const  BrandProducts());
                        },
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

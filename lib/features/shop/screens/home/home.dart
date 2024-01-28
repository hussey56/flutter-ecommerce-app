import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/features/shop/controllers/product_controller.dart';
import 'package:ecom3/features/shop/screens/all_products/allproducts.dart';
import 'package:ecom3/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecom3/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecom3/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  HomeAppBar(),
                  SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),

                  // SearchBar
                  HContainerSearchBar(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),

                  //Categories - Container
                  Padding(
                    padding: EdgeInsets.only(left: HSizes.defaultSpace),
                    child: Column(
                      children: [
                        HSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: HColors.white,
                          onPressed: () {
                            Get.to(() => const AllProducts());
                          },
                        ),
                        SizedBox(
                          height: HSizes.spaceBtwItems,
                        ),

                        //Slider for categories
                        HHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                ],
              ),
            ),
            // Slider
            Padding(
                padding: const EdgeInsets.all(HSizes.defaultSpace),
                child: Column(
                  children: [
                    const PromoSlider(),
                    const SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),

                    // popular Product
                    HSectionHeading(
                      title: 'Popular Products',
                      onPressed: () {
                        Get.to(() => const AllProducts());
                      },
                    ),
                    const SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),
                    GridViewLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) =>
                            const HProductCardVertical()),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

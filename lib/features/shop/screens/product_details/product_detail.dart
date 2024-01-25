import 'package:ecom3/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecom3/features/shop/screens/product_details/widgets/product_bottom_add_to_cart.dart';
import 'package:ecom3/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecom3/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecom3/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecom3/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/text/section_heading.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Product Image Slider
            const ProductImageSlider(),

            // 2. Product Details

            Padding(
              padding: EdgeInsets.only(
                  right: HSizes.defaultSpace,
                  left: HSizes.defaultSpace,
                  bottom: HSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating and Share Button
                  const RatingandShare(),
                  // Price, title, Stack and Brand
                  const ProductMetaData(),
                  // Attributes
                  const ProductAttributes(),
                  // Checkout
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Checkout"),
                    ),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                  // Description
                  const HSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                  // Reviews
                  const Divider(),
                  const SizedBox(
                    height: HSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(()=>ProductRatings());
                          },
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

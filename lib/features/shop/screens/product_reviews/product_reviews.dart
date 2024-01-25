import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/ratings/rating_indicator.dart';
import 'package:ecom3/features/shop/screens/product_reviews/widgets/overall_ratings.dart';
import 'package:ecom3/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecom3/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRatings extends StatelessWidget {
  const ProductRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and reviews are verified and are the people who use the same type of device that you you used."),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),

              // Overall Ratings
              const OverallRating(),
              const ProductRatingIndicator(rating: 4.0),
              Text(
                "12,611",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSection,
              ),

              //User Reviews
             const  UserReviewCard(),
              const  UserReviewCard(),
              const  UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}

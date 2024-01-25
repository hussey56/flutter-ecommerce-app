import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/ratings/rating_indicator.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(HImages.user),
                ),
                const SizedBox(
                  width: HSizes.spaceBtwItems,
                ),
                Text(
                  'JOhn Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const ProductRatingIndicator(rating: 4.0),
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'The User Interface of the app is very interactive and colourful to use which will be quite amazing for the user to operate the application.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show Less',
          trimCollapsedText: ' Show More',
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HColors.primary),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HColors.primary),
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems,
        ),
        RoundedContainer(
          backgroudColor: dark ? HColors.darkerGrey :HColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(HSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("H's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text('02 Nov 2023',style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
                const SizedBox(
                  height: HSizes.spaceBtwItems,
                ),
                ReadMoreText(
                  'The User Interface of the app is very interactive and colourful to use which will be quite amazing for the user to operate the application.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show Less',
                  trimCollapsedText: ' Show More',
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HColors.primary),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: HSizes.spaceBtwSection,)
      ],
    );
  }
}

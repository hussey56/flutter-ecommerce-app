import 'package:ecom3/common/widgets/images/rounded_image.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/dummy/dummy.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(
        title: Text(
          'Sports',
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
              Column(
                children: [
                  HSectionHeading(
                    title: 'Sport Shoes',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>const SizedBox(width: HSizes.spaceBtwItems,),
                      itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  HProductCardHorizontal(product: HDummyData.products[2],)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

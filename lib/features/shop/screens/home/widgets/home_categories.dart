
import 'package:ecom3/features/shop/screens/subcategory/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HHomeCategories extends StatelessWidget {
  const HHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 82,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return HVerticalImageText(
              text: "Cosmetics",
              image: HImages.cosmeticIcon,
              backgroudColor: dark ? HColors.black : HColors.white,
              onTap: () =>Get.to(()=>const SubCategoryScreen()),
            );
          }),
    );
  }
}
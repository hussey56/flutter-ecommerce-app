import 'package:ecom3/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecom3/features/shop/controllers/category_controller.dart';
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
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) return const CategoryShimmerLoader();
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'Data Not Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 82,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return HVerticalImageText(
                text: category.name,
                image: category.image,
                isNetworkImage: true,
                backgroudColor: dark ? HColors.black : HColors.white,
                onTap: () => Get.to(() =>  SubCategoryScreen(category:category)),
              );
            }),
      );
    });
  }
}

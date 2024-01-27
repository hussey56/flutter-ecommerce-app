import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/appbar/tabbar.dart';
import 'package:ecom3/common/widgets/cart/cart_menu_icon.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/controllers/category_controller.dart';
import 'package:ecom3/features/shop/screens/brands/brands.dart';
import 'package:ecom3/features/shop/screens/shop/widgets/category_tab.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../utils/constants/colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CategoryController.instance;
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: HAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            HCartCounterIcon(
                onPressed: () {},
                iconColor: dark ? HColors.white : HColors.dark)
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? HColors.black : HColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(HSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: HSizes.spaceBtwItems,
                        ),
                        HContainerSearchBar(
                          text: 'Search in Store',
                          onTap: () {},
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: HSizes.spaceBtwSection,
                        ),

                        // Featured Brands
                        HSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () => Get.to(() => const BrandScreen()),
                        ),
                        const SizedBox(
                          height: HSizes.spaceBtwItems / 1.5,
                        ),
                        GridViewLayout(
                            itemCount: 4,
                            mainaxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const BrandCard(
                                showBorder: false,
                              );
                            })
                      ],
                    ),
                  ),

                  // Tabs

                  bottom: CTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList(),
                  ),
                )
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => CategoryTab(
                          category: category,
                        ))
                    .toList())),
      ),
    );
  }
}

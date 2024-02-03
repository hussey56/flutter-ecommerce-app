import 'package:ecom3/bottom_navigation_bar.dart';
import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/icons/circular_icon.dart';
import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/loaders/animation_loader.dart';
import 'package:ecom3/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecom3/common/widgets/shimmer/vertical_shimmer_loader.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/features/shop/screens/home/home.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/product/favorite_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    final nav = NavigationController.instance;
    return Scaffold(
      appBar: HAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          HCircularIcon(
            icon: Iconsax.add,
            onPressed: () {
              nav.selectedIndex.value = 0;
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                    ()=> FutureBuilder(
                    future: controller.favoritesProduct(),
                    builder: (context, snapshot) {
                      final emptyWidget = AnimationLoaderWidget(
                          text: "Whoops! Wishlist is Empty",
                          showAction: true,
                          actionText: "Let's add some",
                          onActionPressed: () {
                            nav.selectedIndex.value = 1;
                              // Get.off(() => const NavigationMenu());
                              },
                          animation: HImages.registerAnimation);
                      const loader = HVerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget = HCloudHelperFuction.checkMultipleRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);
                      if (widget != null) return widget;
                      final products = snapshot.data!;

                      return GridViewLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => HProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

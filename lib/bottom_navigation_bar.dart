import 'package:ecom3/features/personalization/screens/settings/settings.dart';
import 'package:ecom3/features/shop/screens/home/home.dart';
import 'package:ecom3/features/shop/screens/shop/shop.dart';
import 'package:ecom3/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          // only for mobile run
          backgroundColor: isDarkMode ? HColors.dark : HColors.white,
          indicatorColor: isDarkMode
              ? HColors.white.withOpacity(0.1)
              : HColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
   const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingScreen()
  ];
}

import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecom3/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/features/personalization/screens/address/address.dart';
import 'package:ecom3/features/shop/screens/orders/orders.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HPrimaryHeaderContainer(
                child: Column(
              children: [
                HAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: HColors.white),
                  ),
                ),

                // User Profile Card
                const UserProfileTile(),
                const SizedBox(
                  height: HSizes.spaceBtwSection,
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  const HSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwItems,
                  ),
                  SettingMenuTile(
                    title: "My Addresses",
                    subTitle: "Set shipping delivery address",
                    icon: Iconsax.safe_home,
                    onTap: () {
                      Get.to(()=> const UserAddressScreen());
                    },
                  ),
                  SettingMenuTile(
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "My Orders",
                    subTitle: "In-progress and Completed Orders",
                    icon: Iconsax.bag_tick,
                    onTap: () {
                      Get.to(()=> const OrdersScreen());
                    },
                  ),
                  SettingMenuTile(
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registerd bank account.",
                    icon: Iconsax.safe_home,
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "My Coupons",
                    subTitle: "List of all the discounted coupons.",
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),

                  // App Settings
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                  const HSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  SettingMenuTile(
                    title: "Load Data",
                    subTitle: "Upload Data to your Cloud Firebase",
                    icon: Iconsax.document_upload,
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "Safe Mode",
                    subTitle: "Search result is safe for all ages",
                    icon: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    title: "HD Image Quality",
                    subTitle: "Set image quality to high",
                    icon: Iconsax.image,
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},
                  ),

                  //logout button
                  const SizedBox(
                    height: HSizes.spaceBtwSection,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {AuthenticationRepository.instance.logout();},
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSection * 2.5,
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

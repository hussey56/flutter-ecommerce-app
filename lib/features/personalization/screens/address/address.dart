import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/features/personalization/screens/address/add_new_address.dart';
import 'package:ecom3/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HColors.primary,
        onPressed: () => Get.to(() => const AddNewAddress()),
        child: const Icon(
          Iconsax.add,
          color: HColors.white,
        ),
      ),
      appBar: HAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              const SizedBox(height: HSizes.spaceBtwItems,),
              SingleAddress(selectedAddress: true)
            ],
          ),
        ),
      ),
    );
  }
}

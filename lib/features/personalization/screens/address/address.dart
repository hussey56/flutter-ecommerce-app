import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/features/personalization/controllers/address_controller.dart';
import 'package:ecom3/features/personalization/screens/address/add_new_address.dart';
import 'package:ecom3/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Obx(
              ()=> FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.allUserAddress(),
                builder: (context, snapshot) {
                  final widget = HCloudHelperFuction.checkMultipleRecordState(
                      snapshot: snapshot);
                  if (widget != null) return widget;

                  final addresses = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => Column(
                        children: [

                          SingleAddress(
                                address: addresses[index],
                                onTap: () =>
                                    controller.selectAddress(addresses[index]),
                              ),
                         const  SizedBox(height: HSizes.spaceBtwItems,)
                        ],
                      ));
                }),
          ),
        ),
      ),
    );
  }
}

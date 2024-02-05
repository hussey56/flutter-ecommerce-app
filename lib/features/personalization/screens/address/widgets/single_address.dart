import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/features/personalization/controllers/address_controller.dart';
import 'package:ecom3/features/personalization/models/address_model.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.onTap, required this.address});

  final VoidCallback onTap;
final AddressModel address;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      (){
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: RoundedContainer(
            padding: const EdgeInsets.all(HSizes.md),
            width: double.infinity,
            showBorder: true,
            backgroudColor: selectedAddress
                ? HColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : dark
                ? HColors.darkerGrey
                : HColors.grey,
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress
                        ? dark
                        ? HColors.light
                        : HColors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: HSizes.sm / 2,
                    ),
                    Text(
                      address.formattedPhoneNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: HSizes.sm / 2,
                    ),
                    Text(
                      address.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: HSizes.sm / 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }

    );
  }
}

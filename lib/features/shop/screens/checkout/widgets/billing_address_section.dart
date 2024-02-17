import 'package:ecom3/features/personalization/controllers/address_controller.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/text/section_heading.dart';

class BillingAddressWidget extends StatelessWidget {
  const BillingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            showActionButton: true,
            onPressed: () => controller.selectShippingAddress(context),
          ),
          controller.selectedAddress.value.id.isNotEmpty
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.selectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: HSizes.spaceBtwItems,
                        ),
                        Text(
                          controller.selectedAddress.value.phoneNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: HSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_history,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: HSizes.spaceBtwItems,
                        ),
                        Expanded(
                          child: Text(
                            '${controller.selectedAddress.value.toString()}',
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Text("Select Address",
                  style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

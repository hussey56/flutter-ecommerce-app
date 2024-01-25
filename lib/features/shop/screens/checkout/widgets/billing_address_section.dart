import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/section_heading.dart';

class BillingAddressWidget extends StatelessWidget {
  const BillingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: true,
        ),
        Text(
          'Muhammad Hassan Khan',
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
              '+92 23423412',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems/2,),
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
                'South Wales Down Town 312, Cape Town, SA',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}

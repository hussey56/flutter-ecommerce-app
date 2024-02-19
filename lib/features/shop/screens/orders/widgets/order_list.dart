import 'package:ecom3/bottom_navigation_bar.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/loaders/animation_loader.dart';
import 'package:ecom3/features/shop/controllers/order_controller.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          final emptyWidget = AnimationLoaderWidget(
            text: "Whoops! No Orders Yet!",
            animation: HImages.registerAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );
          final response = HCloudHelperFuction.checkMultipleRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;
          final orders = snapshot.data!;
          return ListView.separated(
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: HSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                return RoundedContainer(
                  showBorder: true,
                  backgroudColor: dark ? HColors.dark : HColors.light,
                  padding: const EdgeInsets.all(HSizes.md),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.ship),
                          SizedBox(
                            width: HSizes.spaceBtwItems / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: HColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  order.formattedOrderDate,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.arrow_right_34,
                                size: HSizes.iconSm,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: HSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Icon(Iconsax.tag),
                              SizedBox(
                                width: HSizes.spaceBtwItems / 2,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      '[${order.id}]',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Icon(Iconsax.calendar),
                              SizedBox(
                                width: HSizes.spaceBtwItems / 2,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                );
              });
        });
  }
}

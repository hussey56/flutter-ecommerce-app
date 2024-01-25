import 'package:ecom3/features/shop/screens/orders/widgets/order_list.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(
          title: Text('My Orders', style: Theme
              .of(context)
              .textTheme
              .headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: OrderList(),
      ),
    );
  }
}

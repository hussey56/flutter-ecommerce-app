import 'package:ecom3/bottom_navigation_bar.dart';
import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/common/widgets/success_screen/success_screen.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/data/repositories/order/order_repository.dart';
import 'package:ecom3/features/personalization/controllers/address_controller.dart';
import 'package:ecom3/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom3/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';

class OrderController extends GetMaterialApp {
  static OrderController get instance => Get.find();

  // variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      HLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // add methods for order processing

  void processOrder(double totalAmount) async {
    try {
      HFullScreenLoader.openLoadingDialog(
          "Processing your order", HImages.registerAnimation);

      final userid = AuthenticationRepository.instance.authUser!.uid;
      if (userid.isEmpty) return;
      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userid,
          status: OrderStatus.processing,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now(),
          items: cartController.cartitems.toList(),
      );

      await orderRepository.saveOrder(order, userid);

      cartController.clearCart();
      Get.off(() => SuccessScreen(
          image: HImages.staticSuccessIllustration,
          title: "Payment Success!",
          subTitle: "Your Item will be shipped soon!!",
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      HFullScreenLoader.stopLoading();
    }
  }
}

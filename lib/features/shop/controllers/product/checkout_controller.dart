import 'package:ecom3/common/widgets/list_tile/payment_tile.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/models/payment_model.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentModel> selectedPaymentMethod = PaymentModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value =
        PaymentModel(name: 'Paypal', image: HImages.paypal);
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(HSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HSectionHeading(
                title: "Select Payment Method",
                showActionButton: false,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSection,
              ),
              PaymentListTile(
                  paymentMethod:
                      PaymentModel(name: "G Pay", image: HImages.google)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Apple Pay", image: HImages.appleLogo)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Mastercard", image: HImages.mastercard)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Paypal", image: HImages.paypal)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Paystack", image: HImages.paystack)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Paytm", image: HImages.paytm)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Razorpay", image: HImages.razorpay)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              PaymentListTile(
                  paymentMethod:
                  PaymentModel(name: "Visa", image: HImages.visa)),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              const SizedBox(
                width: HSizes.spaceBtwSection,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

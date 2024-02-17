import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom3/features/shop/models/payment_model.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({super.key, required this.paymentMethod});
final PaymentModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: RoundedContainer(
        height: 40,
        width: 40,
        backgroudColor: THelperFunctions.isDarkMode(context)?HColors.light:HColors.white,
        padding: const EdgeInsets.all(HSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}

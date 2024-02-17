import 'package:ecom3/features/personalization/controllers/address_controller.dart';
import 'package:ecom3/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom3/features/shop/controllers/product/variation_controller.dart';
import 'package:ecom3/utils/helpers/network_manger.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());

  }
}
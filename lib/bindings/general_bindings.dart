import 'package:ecom3/utils/helpers/network_manger.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}
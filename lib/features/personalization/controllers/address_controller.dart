import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/address/address_repository.dart';
import 'package:ecom3/features/personalization/models/address_model.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return addresses;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }
}

import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/data/repositories/address/address_repository.dart';
import 'package:ecom3/features/personalization/models/address_model.dart';
import 'package:ecom3/features/personalization/screens/address/add_new_address.dart';
import 'package:ecom3/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/cloud_helper_function.dart';
import 'package:ecom3/utils/helpers/network_manger.dart';
import 'package:ecom3/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/circular_loader.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  RxBool refreshData = true.obs;

  // form variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

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

  Future selectAddress(AddressModel address) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const HCircularLoader(),
      );
      // clear the selected address
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // assign new selected address
      address.selectedAddress = true;
      selectedAddress.value = address;
      // set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(address.id, true);
      Get.back();
    } catch (e) {
      HLoaders.errorSnackBar(
          title: "Error in Selection of Address.", message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          "Storing Address....", HImages.registerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }
      if (!addressFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim());
      final id = await addressRepository.addAddress(address);
      address.id = id;

      await selectedAddress(address);

      HFullScreenLoader.stopLoading();

      HLoaders.successSnackBar(
          title: "Congratulations",
          message: "Uor address has been added successfully");

      refreshData.toggle();

      resetFormfields();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      HFullScreenLoader.stopLoading();
      HLoaders.errorSnackBar(title: "Address Not Found", message: e.toString());
    }
  }

  void resetFormfields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectShippingAddress(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
                padding: const EdgeInsets.all(HSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HSectionHeading(
                      title: "Select Address",
                      showActionButton: false,
                    ),
                    FutureBuilder(
                        future: allUserAddress(),
                        builder: (_, snapshot) {
                          final response =
                              HCloudHelperFuction.checkMultipleRecordState(
                                  snapshot: snapshot);
                          if (response != null) return response;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => SingleAddress(
                                onTap: () async {
                                  await selectAddress(snapshot.data![index]);
                                  Get.back();
                                },
                                address: snapshot.data![index]),
                          );
                        }),
                    const SizedBox(
                      height: HSizes.defaultSpace * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const AddNewAddress()),
                        child: const Text("Add New Address"),
                      ),
                    )
                  ],
                ),
              ),
        ));
  }
}

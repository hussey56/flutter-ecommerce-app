import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom3/features/personalization/models/address_model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty)
        throw 'Unable to find user information. Try again in few moments';
      final result = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();
      return result.docs
          .map((e) => AddressModel.fromDocumentSnapshot(e))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }
}

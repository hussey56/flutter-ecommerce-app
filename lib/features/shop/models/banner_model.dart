import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel(
      {required this.imageUrl,
      required this.targetScreen,
      required this.active});

  // convert modal to json structure  so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
    };
  }

  // map json oriented snapshot from firebase to usermodel
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BannerModel(
        active: data['Active'] ?? false,
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen']);
  }
}

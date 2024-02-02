import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {'brandId': brandId, 'categoryId': categoryId};
  }

  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot sanpshot) {
    final data = sanpshot.data() as Map<String, dynamic>;
    return BrandCategoryModel(
        brandId: data['brandId'], categoryId: data['categoryId']);
  }
}

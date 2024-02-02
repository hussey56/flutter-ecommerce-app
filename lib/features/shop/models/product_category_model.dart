import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'categoryId': categoryId};
  }

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot sanpshot) {
    final data = sanpshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
        productId: data['productId'], categoryId: data['categoryId']);
  }
}

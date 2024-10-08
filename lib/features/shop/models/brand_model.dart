import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured,
      this.productsCount});

  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  toJson() {
    return {
      "Id": id,
      "Name": name,
      "Image": image,
      "ProductsCount": productsCount,
      "isFeatured": isFeatured
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id']??'',
        name: data['Name']??'',
        image: data['Image']??'',
        productsCount: int.parse((data['ProductsCount']??0).toString()),
        isFeatured: data['isFeatured']??false);
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
    final data = document.data()!;

return BrandModel(
    id: data['Id']??'',
    name: data['Name']??'',
    image: data['Image']??'',
    productsCount: int.parse((data['ProductCount']??0).toString()),
    isFeatured: data['isFeatured']??false);
  }
    else{
    return BrandModel.empty();
  }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/product/product_repository.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class AllProductController extends GetxController{
  static AllProductController get instance => Get.find();

final repository = ProductRepository.instance;

Future<List<ProductModel>> fetchProductsByQuery(Query? query)async{
  try{
    if(query==null)return [];
final products = await repository.fetchProductsByQuery(query);
return products;
  }catch(e){
    HLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    return [];
  }
}
}
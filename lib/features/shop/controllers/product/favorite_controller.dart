import 'dart:convert';

import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/product/product_repository.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }
  void initFavorites()  {
    final json = HLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }
  bool isFavorite(String productId){
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
favorites[productId] = true;
saveFavoriteStorage();
HLoaders.customToast(message: "Product has been added to wishlist");
    }else{
HLocalStorage.instance().removeData(productId);
favorites.remove(productId);
saveFavoriteStorage();
favorites.refresh();
HLoaders.customToast(message: "Product has been removed from wishlist");

    }
  }

  void saveFavoriteStorage(){
    final encodedFavorite = json.encode(favorites);
    HLocalStorage.instance().saveData('favorites',encodedFavorite);
  }
  Future<List<ProductModel>> favoritesProduct()async{
    return ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }
}
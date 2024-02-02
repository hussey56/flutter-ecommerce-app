import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/brand/brand_repository.dart';
import 'package:ecom3/data/repositories/product/product_repository.dart';
import 'package:ecom3/features/shop/models/brand_model.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

//-- variable
  final isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedBrands();
  }

// load all brands
  Future<void> fetchFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// Get Brands for category
  Future<List<BrandModel>> getCategoryBrands(String categoryId) async {
    try {
      final brands =
      BrandRepository.instance.getBrandsForCategories(categoryId);
      return brands;
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
// get brand specific products
  Future<List<ProductModel>> getBrandsProduct({required String brandId,int limit =-1}) async {
    try {
      final products =
          ProductRepository.instance.getProductsByBrand(brandId: brandId,limit: limit);
      return products;
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }


}

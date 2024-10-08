import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/categories/category_repository.dart';
import 'package:ecom3/features/shop/models/category_model.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/dummy/dummy.dart';
import 'package:ecom3/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

// Load Category data
  Future<void> fetchCategories() async {
    try {
// start loader
      isLoading.value = true;
      // fetch categories from data source (api, firestore)
      final categories = await categoryRepository.getAllCategories();
      // update categories list
      allCategories.assignAll(categories);
      // filter categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// load selected category data
  // get category products
  Future<List<ProductModel>> getCategoryProduct(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = ProductRepository.instance
          .getProductsByCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

// get category or sub category products
  Future<List<CategoryModel>> getSubCategoryProduct(String categoryId) async {
    try {
      final subcategories =
          await categoryRepository.getSubCategories(categoryId);
      return subcategories;
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

// add dummy data
  Future<void> addDummyData() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          "Uploading Categories", HImages.registerAnimation);
      final data = HDummyData.categories;
      await categoryRepository.uploadDummyData(data);
      HLoaders.successSnackBar(
          title: "Success", message: "Data Uploaded Successfully");
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      HFullScreenLoader.stopLoading();
    }
  }
}

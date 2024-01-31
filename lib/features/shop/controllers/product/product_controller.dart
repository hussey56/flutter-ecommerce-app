import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/data/repositories/product/product_repository.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/dummy/dummy.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  RxList<ProductModel> fetauredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      fetauredProducts.assignAll(products);
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largetPrice = 0.0;

    // if no variable so return the actual price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // calculate the smallest and largest price
      for (var variation in product.productVariations!) {
        // determine the price to consider (sale price is available , othervise regular price)
        double pricetoConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // update smallest and largest price
        if (pricetoConsider < smallestPrice) {
          smallestPrice = pricetoConsider;
        }

        if (pricetoConsider > largetPrice) {
          largetPrice = pricetoConsider;
        }
      }
      if (smallestPrice.isEqual(largetPrice)) {
        return largetPrice.toString();
      } else {
        return '$smallestPrice - \$$largetPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // add dummy data
  Future<void> addDummyData() async {
    try {
      HFullScreenLoader.openLoadingDialog(
          "Uploading Products", HImages.registerAnimation);
      final data = HDummyData.products;
      await productRepository.uploadDummyData(data);
      HLoaders.successSnackBar(
          title: "Success", message: "Data Uploaded Successfully");
    } catch (e) {
      HLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      HFullScreenLoader.stopLoading();
    }
  }
}

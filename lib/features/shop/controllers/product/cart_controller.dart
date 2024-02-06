import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/features/shop/controllers/product/variation_controller.dart';
import 'package:ecom3/features/shop/models/cart_item_model.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartitems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  void addToCart(ProductModel product) {
    // Quantity check
    if (productQuantityInCart.value < 1) {
      HLoaders.customToast(message: "Select Quantity");
      return;
    }

    // variation selection if applied
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      HLoaders.customToast(message: "Select Variation");
      return;
    }

    /// check stock
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        HLoaders.errorSnackBar(
            title: "Oh Snap!", message: "Selected Variation s out of stock");
        return;
      }
    } else {
      if (product.stock < 1) {
        HLoaders.errorSnackBar(
            title: "Oh Snap!", message: "Selected Variation s out of stock");
        return;
      }
    }

    // convert the selected product into cart item model
    final selectedCartItem =
        converttoCartItem(product, productQuantityInCart.value);

    // check if the cart item added already
    int index = cartitems.indexWhere((cartitem) =>
        cartitem.productId == selectedCartItem.productId &&
        cartitem.variationId == selectedCartItem.variationId);
    if(index >= 0){
      // this quantity is already added or updated / removed from the design
      cartitems[index].quantity = selectedCartItem.quantity;
    }

  }

  CartItemModel converttoCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
        productId: product.id,
        price: price,
        title: product.title,
        quantity: quantity,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariation: isVariation ? variation.attributeValues : null);
  }
}

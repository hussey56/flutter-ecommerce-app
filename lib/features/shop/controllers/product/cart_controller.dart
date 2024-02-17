import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:ecom3/features/shop/controllers/product/variation_controller.dart';
import 'package:ecom3/features/shop/models/cart_item_model.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:ecom3/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartitems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController(){
    loadCartItems();
  }
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
    if (index >= 0) {
      // this quantity is already added or updated / removed from the design
      cartitems[index].quantity = selectedCartItem.quantity;
    } else {
      cartitems.add(selectedCartItem);
    }

    updateCart();
    HLoaders.customToast(message: "Product has been added to the Cart");
  }
 void addOnetoCart(CartItemModel item){
    int index = cartitems.indexWhere((element) => element.productId == item.productId && element.variationId == item.variationId );
    if(index >=0){
      cartitems[index].quantity += 1;
    }else{
      cartitems.add(item);
    }
    updateCart();
 }

  void removeOnetoCart(CartItemModel item){
    int index = cartitems.indexWhere((element) => element.productId == item.productId && element.variationId == item.variationId );
    if(index >=0){
     if(cartitems[index].quantity >1){
       cartitems[index].quantity -= 1;
     }else{
       cartitems[index].quantity == 1 ? removeFromCartDialog(index):cartitems.removeAt(index);
     }
    }
    updateCart();
  }
  void removeFromCartDialog(int index){
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: (){
        cartitems.removeAt(index);
        updateCart();
        HLoaders.customToast(message: "Product removed from the Cart");
        Get.back();
      },
      onCancel: ()=>()=>Get.back()
    );
  }
  void updateCart() {
    updateCartTotal();
    saveCartItem();
    cartitems.refresh();
  }

  void updateCartTotal() {
    double calculatedCartTotal = 0.0;
    int calculatedNoofItems = 0;
    for (var item in cartitems) {
      calculatedCartTotal += (item.price) * item.quantity.toDouble();
      calculatedNoofItems += item.quantity;
    }
    totalCartPrice.value = calculatedCartTotal;
    noOfCartItems.value = calculatedNoofItems;
  }

  void saveCartItem() {
    final cartItems = cartitems.map((element) => element.toJson()).toList();
    HLocalStorage.instance().saveData("cartitems", cartItems);
  }

  void loadCartItems() {
    final cartItemsString =
        HLocalStorage.instance().readData<List<dynamic>>("cartitems");
    if (cartItemsString != null) {
      cartitems.assignAll(cartItemsString
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartitems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityinCart(String productId, String VariationId) {
    final foundItem = cartitems.firstWhere(
        (element) =>
            element.productId == productId &&
            element.variationId == VariationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart(){
    productQuantityInCart.value = 0;
    cartitems.clear();
    updateCart();
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


void updateAlreadyAddedProduct(ProductModel product){
    // for single type product
  if(product.productType == ProductType.single.toString()){
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  }else{
    final variatioId = variationController.selectedVariation.value.id;
    if(variatioId.isNotEmpty){
      productQuantityInCart.value = getVariationQuantityinCart(product.id, variatioId);
    }else{
productQuantityInCart.value = 0;
    }
  }
}
}

class TPricingCalculator {
  TPricingCalculator._();

  // Calculate tax
  static double calculatedTotalPrice(double productPrice, String location) {
    double taxtRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxtRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

// Calculate Tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate for the given location from a tax  rate database or api
    //  currently return an a fixed rate
    return 0.10;
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost for the given location from a tax  rate database or api
    //  currently return an a fixed rate
    return 5.0;
  }

  // sum all cart values and return totla amount
  // static double calculateCartTotal(CartModel cart){
  //   return cart.items.map((e)=>e.price).fold(0,previousPrice,currentPrice)=>previousPrice + (currentPrice ?? 0));
  // }
}

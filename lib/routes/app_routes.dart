import 'package:ecom3/features/authentication/screens/signup/signup.dart';
import 'package:ecom3/features/shop/screens/orders/orders.dart';
import 'package:ecom3/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecom3/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecom3/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/shop/shop.dart';

class AppRoutes {
  static final pages = [

  GetPage(name: HRoutes. home, page: () => const HomeScreen()),
  GetPage(name: HRoutes.store, page: () => const StoreScreen()),
  GetPage(name: HRoutes.favourites, page: () => const WishlistScreen()),
  GetPage(name: HRoutes.settings, page: () => const SettingScreen()),
  GetPage(name: HRoutes.productReviews, page: () => const ProductRatings()),
  GetPage(name: HRoutes.order, page: () => const OrdersScreen()),
  GetPage(name: HRoutes.checkout, page: () => const CheckoutScreen()), 
  GetPage(name: HRoutes.cart, page: () => const CartScreen()),
  GetPage(name: HRoutes.userProfile, page: () => const ProfileScreen()),
  GetPage(name: HRoutes.userAddress, page: () => const UserAddressScreen()), 
  GetPage(name: HRoutes.signup, page: () => const SignUpScreen()),
  GetPage(name: HRoutes.verifyEmail, page: () => const VerifyEmailScreen()), 
  GetPage(name: HRoutes.signIn, page: () => const LoginScreen()), 
  GetPage(name: HRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: HRoutes.onBoarding, page: () => const onBoardingScreen()),

  ];
}
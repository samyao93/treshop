import 'package:get/get.dart';
import 'package:treshop/src/pages/all_product/all_product_page.dart';
import 'package:treshop/src/pages/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'package:treshop/src/pages/cart/cart_page.dart';
import 'package:treshop/src/pages/checkout/checkout_page.dart';
import 'package:treshop/src/pages/coupon/coupon_page.dart';
import 'package:treshop/src/pages/payment/payment_page.dart';
import 'package:treshop/src/pages/product/product_page.dart';
import 'package:treshop/src/pages/search/search_page.dart';
import 'package:treshop/src/pages/shipping/shipping_page.dart';
import 'package:treshop/src/pages/sign_up/sign_up_page.dart';

import '../pages/on_boarding/on_boarding_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/splash/splash_page.dart';
import 'constants.dart';


List<GetPage> allRoutes = [
  GetPage(name: Routes.splash, page: () => SplashScreen()),
  GetPage(name: Routes.on_boarding, page: () => OnBoardingScreen()),
  GetPage(name: Routes.sign_in, page: () => SignInScreen()),
  GetPage(name: Routes.sign_up, page: () => SignUpScreen()),
  GetPage(name: Routes.home, page: () => BottomNavigationBarScreen(initialIndex: 0)),
  GetPage(name: Routes.search, page: () => SearchScreen()),
  GetPage(name: Routes.shop, page: () => BottomNavigationBarScreen(initialIndex: 2)),
  GetPage(name: Routes.all_product, page: () => AllProductScreen()),
  GetPage(name: Routes.favorite, page: () => BottomNavigationBarScreen(initialIndex: 1)),
  GetPage(name: Routes.product, page: () => ProductScreen()),
  GetPage(name: Routes.cart, page: () => CartScreen()),
  GetPage(name: Routes.coupon, page: () => CouponScreen()),
  GetPage(name: Routes.checkout, page: () => CheckoutScreen()),
  GetPage(name: Routes.payment, page: () => PaymentScreen()),
  GetPage(name: Routes.shipping, page: () => ShippingScreen()),
];

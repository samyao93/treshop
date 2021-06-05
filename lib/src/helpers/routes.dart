import 'package:get/get.dart';
import 'package:treshop/src/pages/category/category_page.dart';
import 'package:treshop/src/pages/chat/chat_page.dart';
import 'package:treshop/src/pages/profile_detail/profile_detail_page.dart';
import 'package:treshop/src/pages/wallet/wallet_page.dart';

import '../pages/all_product/all_product_page.dart';
import '../pages/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/checkout/checkout_page.dart';
import '../pages/coupon/coupon_page.dart';
import '../pages/on_boarding/on_boarding_page.dart';
import '../pages/order/order_page.dart';
import '../pages/order_detail/order_detail_page.dart';
import '../pages/payment/payment_page.dart';
import '../pages/product/product_page.dart';
import '../pages/search/search_page.dart';
import '../pages/shipping/shipping_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../pages/splash/splash_page.dart';
import '../pages/tracking_order/tracking_order_page.dart';
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
  GetPage(name: Routes.select_coupon, page: () => SelectCouponScreen()),
  GetPage(name: Routes.checkout, page: () => CheckoutScreen()),
  GetPage(name: Routes.payment, page: () => PaymentScreen()),
  GetPage(name: Routes.shipping, page: () => ShippingScreen()),
  GetPage(name: Routes.checkout_success, page: () => CheckoutSuccessScreen()),
  GetPage(name: Routes.profile, page: () => BottomNavigationBarScreen(initialIndex: 3)),
  GetPage(name: Routes.order, page: () => OrderScreen()),
  GetPage(name: Routes.order_detail, page: () => OrderDetailScreen()),
  GetPage(name: Routes.tracking_order, page: () => TrackingOrderScreen()),
  GetPage(name: Routes.profile_detail, page: () => ProfileDetailScreen()),
  GetPage(name: Routes.coupon, page: () => CouponScreen()),
  GetPage(name: Routes.wallet, page: () => WalletScreen()),
  GetPage(name: Routes.chat, page: () => ChatScreen()),
  GetPage(name: Routes.category, page: () => CategoryScreen()),
];

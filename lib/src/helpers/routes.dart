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
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.onBoarding,
    page: () =>const OnBoardingScreen(),
  ),
  GetPage(
    name: Routes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: Routes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const BottomNavigationBarScreen(initialIndex: 0),
  ),
  GetPage(
    name: Routes.search,
    page: () =>const SearchScreen(),
  ),
  GetPage(
    name: Routes.shop,
    page: () => const BottomNavigationBarScreen(initialIndex: 2),
  ),
  GetPage(
    name: Routes.allProduct,
    page: () => const AllProductScreen(),
  ),
  GetPage(
    name: Routes.favorite,
    page: () => const BottomNavigationBarScreen(initialIndex: 1),
  ),
  GetPage(
    name: Routes.product,
    page: () =>const ProductScreen(),
  ),
  GetPage(
    name: Routes.cart,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: Routes.selectCoupon,
    page: () => const SelectCouponScreen(),
  ),
  GetPage(
    name: Routes.checkout,
    page: () => const CheckoutScreen(),
  ),
  GetPage(
    name: Routes.payment,
    page: () =>const PaymentScreen(),
  ),
  GetPage(
    name: Routes.shipping,
    page: () =>const ShippingScreen(),
  ),
  GetPage(
    name: Routes.checkoutSuccess,
    page: () => const CheckoutSuccessScreen(),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const BottomNavigationBarScreen(initialIndex: 3),
  ),
  GetPage(
    name: Routes.order,
    page: () =>const OrderScreen(),
  ),
  GetPage(
    name: Routes.orderDetail,
    page: () => const OrderDetailScreen(),
  ),
  GetPage(
    name: Routes.trackingOrder,
    page: () => const TrackingOrderScreen(),
  ),
  GetPage(
    name: Routes.profileDetail,
    page: () =>const ProfileDetailScreen(),
  ),
  GetPage(
    name: Routes.coupon,
    page: () => const CouponScreen(),
  ),
  GetPage(
    name: Routes.wallet,
    page: () => const WalletScreen(),
  ),
  GetPage(
    name: Routes.chat,
    page: () => const ChatScreen(),
  ),
  GetPage(
    name: Routes.category,
    page: () => const CategoryScreen(),
  ),
];

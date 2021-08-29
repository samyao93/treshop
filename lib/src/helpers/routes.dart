import 'package:get/get.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/pages/all_product/all_product_page.dart';
import 'package:treshop/src/pages/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'package:treshop/src/pages/category/category_page.dart';
import 'package:treshop/src/pages/chat/chat_page.dart';
import 'package:treshop/src/pages/checkout/checkout_page.dart';
import 'package:treshop/src/pages/coupon/coupon_page.dart';
import 'package:treshop/src/pages/favorite/favorite_page.dart';
import 'package:treshop/src/pages/language/language_page.dart';
import 'package:treshop/src/pages/new_password/new_password_page.dart';
import 'package:treshop/src/pages/on_boarding/on_boarding_page.dart';
import 'package:treshop/src/pages/order/order_page.dart';
import 'package:treshop/src/pages/order_detail/order_detail_page.dart';
import 'package:treshop/src/pages/payment/payment_page.dart';
import 'package:treshop/src/pages/product/product_page.dart';
import 'package:treshop/src/pages/profile_detail/profile_detail_page.dart';
import 'package:treshop/src/pages/reset_password/reset_password.dart';
import 'package:treshop/src/pages/reset_password_success/reset_password_success_page.dart';
import 'package:treshop/src/pages/search/search_page.dart';
import 'package:treshop/src/pages/shipping/shipping_page.dart';
import 'package:treshop/src/pages/sign_in/sign_in_page.dart';
import 'package:treshop/src/pages/sign_up/sign_up_page.dart';
import 'package:treshop/src/pages/splash/splash_page.dart';
import 'package:treshop/src/pages/tracking_order/tracking_order_page.dart';
import 'package:treshop/src/pages/wallet/wallet_page.dart';


List<GetPage> allRoutes = [
  GetPage<dynamic>(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.home,
    page: () => const BottomNavigationBarScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.search,
    page: () => const SearchScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.shop,
    page: () => const BottomNavigationBarScreen(initialIndex: 2),
  ),
  GetPage<dynamic>(
    name: Routes.allProduct,
    page: () => const AllProductScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.favorite,
    page: () => const FavoriteScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.product,
    page: () => const ProductScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.cart,
    page: () => const BottomNavigationBarScreen(initialIndex: 1),
  ),
  GetPage<dynamic>(
    name: Routes.selectCoupon,
    page: () => const SelectCouponScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.checkout,
    page: () => const CheckoutScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.payment,
    page: () => const PaymentScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.shipping,
    page: () => const ShippingScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.checkoutSuccess,
    page: () => const CheckoutSuccessScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.profile,
    page: () => const BottomNavigationBarScreen(initialIndex: 3),
  ),
  GetPage<dynamic>(
    name: Routes.order,
    page: () => const OrderScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.orderDetail,
    page: () => const OrderDetailScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.trackingOrder,
    page: () => const TrackingOrderScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.profileDetail,
    page: () => const ProfileDetailScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.coupon,
    page: () => const CouponScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.wallet,
    page: () => const WalletScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.chat,
    page: () => const ChatScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.category,
    page: () => const CategoryScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.language,
    page: () => const LanguageScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.resetPasswordSuccess,
    page: () => const ResetPasswordSuccessScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.newPassword,
    page: () => const NewPasswordScreen(),
  ),
];

part of '../cart_page.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: AppLocalizations.of(context)!.cart,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.search),
            icon: const Icon(FeatherIcons.search),
          ),
        ],
      ),
      body: (CartList.cartList.isNotEmpty)
          ? const _BuildBody()
          : IllustrationWidget(
              icon: CustomIcon.shoppingBag,
              title: AppLocalizations.of(context)!.shopping_bag_is_empty,
              subtitle: AppLocalizations.of(context)!
                  .looks_like_you_havent_added_any_item_to_your_cart_yet,
            ),
    );
  }
}

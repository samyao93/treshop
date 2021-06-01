part of '../cart_page.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? _total = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CartProvider>(builder: (context, provider, snapshot) {
      var priceList = provider.cartList.map((cart) => cart.price);
      _total = priceList.fold(0, (p, c) => p! + c!);
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.cart,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(Routes.search),
              icon: Icon(FeatherIcons.search),
            ),
          ],
        ),
        body: (provider.cartList.length != 0)
            ? Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: provider.cartList.length,
                      separatorBuilder: (context, index) {
                        return Divider(color: theme.hintColor);
                      },
                      itemBuilder: (context, index) {
                        var cart = provider.cartList[index];
                        return CartCard(
                          cart: cart,
                          onRemoveTap: () {
                            provider.cartList.removeAt(index);
                          },
                        );
                      },
                    ),
                  ),
                  _FooterSection(
                    total: _total!.toInt(),
                  )
                ],
              )
            : EmptySection(),
      );
    });
  }
}

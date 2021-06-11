part of '../product_page.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isLiked = false;
  int _qty = 1;
  ProductModel? product;

  var rng = Random();

  @override
  void initState() {
    super.initState();
    product = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _BuildAppBar(
                    product: product!,
                    isLiked: _isLiked,
                    onFavoriteTap: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                    onLeadingTap: () {
                      Future.delayed(const Duration(microseconds: 0), Get.back)
                          .then((value) => setState(() {}));
                    }),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: Const.margin),
                      _BuildNameAndRating(product: product!),
                      const SizedBox(height: Const.space25),
                      _BuildDescription(product: product!),
                      const SizedBox(height: Const.space15),
                      _BuildItemSize(product: product!),
                      const SizedBox(height: Const.space15),
                      _BuildItemColor(product: product!),
                      const SizedBox(height: Const.space25),
                    ],
                  ),
                )
              ],
            ),
          ),
          _FooterSection(
            product: product!,
            qty: _qty,
            total: product!.price! * _qty,
            onAddTap: () {
              setState(() => _qty = max(1, _qty + 1));
            },
            onRemoveTap: () {
              if (_qty != 1) {
                setState(() {
                  _qty = min(50, _qty - 1);
                });
              }
            },
            onAddToCartTap: () {
              final productProv = Provider.of<ProductProvider>(
                context,
                listen: false,
              );
              final cart = Provider.of<CartProvider>(
                context,
                listen: false,
              );

              if (productProv.itemSizeSelected == null) {
                showToast(
                    msg: AppLocalizations.of(context)!
                        .please_select_your_item_size);
              } else if (productProv.itemColorSelected == null) {
                showToast(
                    msg: AppLocalizations.of(context)!
                        .please_select_your_item_color);
              } else {
                showToast(msg: AppLocalizations.of(context)!.added_to_cart);
                cart.cartList.add(CartModel(
                  orderId: rng.nextInt(5000),
                  color: productProv.itemColorSelected,
                  price: product!.price! * _qty,
                  productImage: product!.images!.first,
                  productName: product!.name,
                  qty: _qty,
                  size: productProv.itemSizeSelected,
                ));
              }
            },
          )
        ],
      ),
    );
  }
}

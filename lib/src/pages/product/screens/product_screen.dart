part of '../product_page.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isLiked = false;
  int _qty = 1;
  
  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ProductModel product = ProductList.allProduct.first;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _BuildAppBar(
                  product: product,
                  isLiked: _isLiked,
                  onFavoriteTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: Const.margin),
                      _BuildNameAndRating(product: product),
                      SizedBox(height: Const.space25),
                      _BuildDescription(product: product),
                      SizedBox(height: Const.space15),
                      _BuildItemSize(product: product),
                      SizedBox(height: Const.space15),
                      _BuildItemColor(product: product),
                      SizedBox(height: Const.space25),
                    ],
                  ),
                )
              ],
            ),
          ),
          _FooterSection(
            product: product,
            qty: _qty,
            total: product.price! * _qty,
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
              final provider = Provider.of<ProductProvider>(
                context,
                listen: false,
              );

              if (provider.itemSizeSelected == null) {
                showToast(msg: AppLocalizations.of(context)!.please_select_your_item_size);
              } else if (provider.itemColorSelected == null) {
                showToast(msg: AppLocalizations.of(context)!.please_select_your_item_color);
              } else {
                CartList.cartList.add(
                  CartModel(
                    orderId: rng.nextInt(5000),
                    color: provider.itemColorSelected,
                    price: product.price! * _qty,
                    productImage: product.images!.first,
                    productName: product.name,
                    qty: _qty,
                    size: provider.itemSizeSelected,
                  )
                );
              }
            },
          )
        ],
      ),
    );
  }
}

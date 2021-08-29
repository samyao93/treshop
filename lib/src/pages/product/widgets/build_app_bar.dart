part of '../product_page.dart';

class _BuildAppBar extends StatelessWidget {
  const _BuildAppBar({
    Key? key,
    required this.product,
    this.onFavoriteTap,
    this.isLiked,
    this.onLeadingTap,
  }) : super(key: key);

  final ProductModel product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onLeadingTap;
  final bool? isLiked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _themeProv = Provider.of<ThemeProvider>(context);

    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: Const.space12),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onLeadingTap,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: theme.cardColor.withOpacity(.4),
            child:  Icon(
              Icons.arrow_back,
              color: _themeProv.isLightTheme ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onFavoriteTap,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: theme.cardColor.withOpacity(.4),
            child: Icon(
              (isLiked == true) ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
        const SizedBox(width: Const.margin),
      ],
      pinned: true,
      expandedHeight: 300,
      backgroundColor: theme.backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Swiper(
          itemCount: product.images?.length,
          loop: false,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
          ),
          itemBuilder: (context, index) {
            final image = product.images![index];
            return CustomNetworkImage(
              image: image,
              width: Screens.width(context),
              height: 300,
              fit: BoxFit.fitWidth,
              borderRadius: BorderRadius.zero,
            );
          },
        ),
      ),
    );
  }
}

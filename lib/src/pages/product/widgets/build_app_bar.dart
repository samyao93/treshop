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

    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left:Const.space12),
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap:onLeadingTap,
          child: CircleAvatar(
            radius: 25.0,
            backgroundColor: theme.cardColor.withOpacity(.4),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onFavoriteTap,
          child: CircleAvatar(
            radius: 25.0,
            backgroundColor: theme.cardColor.withOpacity(.4),
            child: Icon(
              (isLiked == true) ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(width: Const.margin),
      ],
      pinned: true,
      expandedHeight: 300.0,
      backgroundColor: theme.backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Swiper(
            itemCount: product.images?.length,
            autoplay: false,
            loop: false,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
            ),
            itemBuilder: (context, index) {
              final image = product.images![index];
              return CustomNetworkImage(
                image: image,
                width: Screens.width(context),
                height: 300.0,
                fit: BoxFit.fitWidth,
                borderRadius: BorderRadius.zero,
              );
            },
          ),
        ),
      ),
    );
  }
}

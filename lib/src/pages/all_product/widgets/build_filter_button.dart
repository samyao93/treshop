part of '../all_product_page.dart';

class _BuildFilterButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSort;
  final IconData icon;
  final String label;

  const _BuildFilterButton({
    Key? key,
    this.onTap,
    this.isSort = false,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 8,
          margin: EdgeInsets.zero,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: (isSort == true)
                  ?const BorderRadius.only(
                      topLeft: Radius.circular(Const.radius),
                      bottomLeft: Radius.circular(Const.radius),
                    )
                  :const BorderRadius.only(
                      topRight: Radius.circular(Const.radius),
                      bottomRight: Radius.circular(Const.radius),
                    ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: ColorLight.fontTitle,
                  size: 18,
                ),
              const  SizedBox(width: Const.space12),
                AutoSizeText(
                  label,
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: ColorLight.fontTitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

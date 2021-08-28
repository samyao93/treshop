part of '../home_page.dart';

class _BuildSearch extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSearchTap;

  const _BuildSearch({
    this.controller,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onSearchTap,
      child: Container(
        width: Screens.width(context),
        height: 50,
        margin:const EdgeInsets.symmetric(horizontal: Const.margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Const.radius),
          color: theme.cardColor,
        ),
        child: TextField(
          controller: controller,
          autocorrect: false,
          enabled: false,
          style: theme.textTheme.bodyText2,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.search_anything_you_like,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: onSearchTap,
              color: theme.primaryColor,
            ),
            contentPadding:const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}

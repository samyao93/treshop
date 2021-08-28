part of '../home_page.dart';

class _BuildAppBar extends StatelessWidget {
  const _BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      height: 60,
      child: Container(
        color: _theme.backgroundColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _theme.cardColor,
            borderRadius: BorderRadius.circular(Const.radius),
          ),
          child: IconButton(
            // onPressed: ()=>Get.toNamed<dynamic>(Routes.notification),
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.bell,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

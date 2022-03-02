part of '../on_boarding_page.dart';


class _OnBoardingCard extends StatelessWidget {
  const _OnBoardingCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OnBoardingModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomShakeTransition(
            child: SvgPicture.asset(
              data.image!,
              width: Screens.width(context) / 2,
              height: Screens.width(context) / 2,
            ),
          ),
          SizedBox(height: Screens.width(context) / 5),
          CustomShakeTransition(
            duration:const Duration(milliseconds: 800),
            child: AutoSizeText(
              data.title!,
              style: theme.textTheme.headline1,
              maxLines: 1,
            ),
          ),
          SizedBox(height: Screens.width(context) / 15),
          CustomShakeTransition(
            duration:const Duration(milliseconds: 900),
            child: AutoSizeText(
              data.subtitle!,
              style: theme.textTheme.subtitle1,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: Screens.width(context) / 5),
        ],
      ),
    );
  }
}

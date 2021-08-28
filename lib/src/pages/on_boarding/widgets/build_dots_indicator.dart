part of '../on_boarding_page.dart';


class _BuildDotsIndicator extends StatelessWidget {
  const _BuildDotsIndicator({
    Key? key,
    required int? currentIndex,
  }) : _currentIndex = currentIndex, super(key: key);

  final int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Screens.heigth(context) / 5,
      left: 0,
      right: 0,
      child: CustomFadeTransition(
        duration:const Duration(milliseconds: 200),
        child: CustomDotsIndicator(
          dotsCount: OnBoardingList.onBoardingList(context),
          position: _currentIndex,
        ),
      ),
    );
  }
}

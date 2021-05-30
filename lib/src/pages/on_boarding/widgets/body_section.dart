part of '../on_boarding_page.dart';

class _BodySection extends StatelessWidget {
  final ValueChanged<int>? onPageChanged;

  const _BodySection({Key? key, this.onPageChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemCount: OnBoardingList.onBoardingList(context).length,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      onPageChanged:onPageChanged,
      itemBuilder: (context, index) {
        var data = OnBoardingList.onBoardingList(context)[index];
        return _OnBoardingCard(data: data);
      },
    );
  }
}

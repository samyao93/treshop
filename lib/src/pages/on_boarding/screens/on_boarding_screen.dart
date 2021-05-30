part of '../on_boarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int? _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BodySection(onPageChanged: (v) => setState(() => _currentIndex = v)),
          _BuildDotsIndicator(currentIndex: _currentIndex),
          _BuildStartButton(index: _currentIndex),
          _BuildSkipButton(index: _currentIndex),
        ],
      ),
    );
  }
}

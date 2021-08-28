part of '../bottom_navigation_bar_page.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  final int initialIndex;

  const BottomNavigationBarScreen({Key? key, this.initialIndex = 0})
      : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  PageController? _controller;
  DateTime? _currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
    refreshTabController();
  }

  void refreshTabController() {
    setState(() => _selectedIndex = widget.initialIndex);
  }

  Future<bool> _willPopCallback(BuildContext context) async {
    final now = DateTime.now();
    if (_selectedIndex != 1) {
      if (_currentBackPressTime == null ||
          now.difference(_currentBackPressTime!) > const Duration(seconds: 4)) {
        _currentBackPressTime = now;
        await showToast(msg: AppLocalizations.of(context)!.press_again_to_exit);
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => _willPopCallback(context),
      child: Scaffold(
        body: PageView(
          controller: _controller,
          physics:const NeverScrollableScrollPhysics(),
          onPageChanged: (v) => setState(() => _selectedIndex = v),
          children: BottomNavigationList.pageList(context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (v) {
            setState(() {
              _controller!.animateToPage(
                v,
                duration:const Duration(milliseconds: 200),
                curve: Curves.ease,
              );
            });
          },
          currentIndex: _selectedIndex,
          selectedItemColor: theme.primaryColor,
          unselectedItemColor: theme.hintColor,
          selectedLabelStyle:
              theme.textTheme.subtitle2!.copyWith(fontSize: 10),
          unselectedLabelStyle:
              theme.textTheme.subtitle2!.copyWith(fontSize: 10),
          type: BottomNavigationBarType.fixed,
          iconSize: 16,
          items: BottomNavigationList.items(context),
        ),
      ),
    );
  }
}

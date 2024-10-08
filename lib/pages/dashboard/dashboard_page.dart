import 'package:fic7_fe/common/constants/images.dart';
import 'package:fic7_fe/pages/home_page.dart';
import 'package:fic7_fe/pages/more/more_page.dart';
import 'package:fic7_fe/pages/order_history/order_history_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;

  @override
  void initState() {
    super.initState();

    _screens = [
      const HomePage(),
      const OrderHistoryPage(),
      const MorePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _getBottomWidget(singleVendor),
        onTap: (int index) {
          _setPage(index);
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).textTheme.bodyLarge!.color,
        showUnselectedLabels: true,
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  BottomNavigationBarItem _barItem(String icon, String? label, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(
        icon,
        color: index == _pageIndex
            ? Theme.of(context).primaryColor
            : Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
        height: 25,
        width: 25,
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomWidget(bool isSingleVendor) {
    List<BottomNavigationBarItem> list = [];

    if (!isSingleVendor) {
      list.add(_barItem(Images.homeImage, 'Home', 0));
      list.add(_barItem(Images.shoppingImage, 'Orders', 1));
      list.add(_barItem(Images.moreImage, 'More', 2));
    } else {
      list.add(_barItem(Images.homeImage, 'Home', 0));
      list.add(_barItem(Images.shoppingImage, 'Orders', 1));
      list.add(_barItem(Images.moreImage, 'More', 2));
    }

    return list;
  }
}

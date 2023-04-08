import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:damasfollows/screens/homepage.dart';
import 'package:damasfollows/screens/profilescreen.dart';
import 'package:damasfollows/screens/screenfive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomNavBar extends StatefulWidget {
  var connectedornot;

  BottomNavBar({super.key, required this.connectedornot});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  // final CurvedNavigationBarState? navBarState =
  //     _bottomNavigationKey.currentState;
  // navBarState?.setPage(1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 60.0,
          items: const <Widget>[
            Image(
              image: AssetImage('assets/home.png'),
              height: 30,
              width: 30,
            ),
            Image(
              image: AssetImage('assets/ic_list.png'),
              height: 30,
              width: 30,
            ),
            Image(
              image: AssetImage('assets/ic_faq.png'),
              height: 30,
              width: 30,
            ),



          ],
          onTap: (selectedindex) {
            setState(() {
              _page = selectedindex;
            });
          },
          color: Colors.black26,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
        ),
        body: getSelectedWidget(index: _page),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    var connectedornot;
    Widget widget;
    switch (index) {
      case 0:
        widget = HomePage(connectedornot: connectedornot);
        break;
      case 1:
        widget = const ScreenFive();
        break;
      case 2:
        widget = const Profilescreen()  ;
        break;
      default:
        widget =  HomePage(connectedornot: connectedornot);

    }
    return widget;
  }
}

import 'package:castom_nab_bar10/screen/cetgory.dart';
import 'package:castom_nab_bar10/screen/home.dart';
import 'package:castom_nab_bar10/screen/product.dart';
import 'package:castom_nab_bar10/screen/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CarveNabBar extends StatefulWidget {
  const CarveNabBar({super.key});

  @override
  State<CarveNabBar> createState() => _CarveNabBarState();
}

class _CarveNabBarState extends State<CarveNabBar> {
  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.category_sharp, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.production_quantity_limits, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: _page == 0
              ? Color.fromARGB(255, 66, 190, 228)
              : _page == 1
                  ? const Color.fromARGB(255, 226, 198, 112)
                  : _page == 2
                      ? const Color.fromARGB(255, 108, 235, 50)
                      : const Color.fromARGB(255, 226, 112, 192),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: pages[_page]);
  }

  List<Widget> pages = [Cetegory(), Home(), Product(), Profile()];
}

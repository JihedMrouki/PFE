// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../Profile/Profile.dart';
import '../cart/cart.dart';
import '../history/history.dart';
import '../menu/menu.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _screens = [
    const Menu(),
    const Profile(),
    const Cart(),
    const History(),
  ];

  int _selectedIndex = 0;

  void _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 0, right: 0, left: 0, top: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                unselectedItemColor: const Color.fromRGBO(60, 170, 54, 1),
                onTap: _selectIndex,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _selectedIndex == 0
                            ? Icon(Icons.home)
                            : Icon(Icons.home_filled),
                            // ? SvgPicture.asset('assets/icons/Home_icon.svg')
                            // : SvgPicture.asset('assets/icons/Home_icon.svg' , color: Colors.green,)
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _selectedIndex == 1
                            ? Icon(Icons.account_circle_outlined)
                            : Icon(Icons.account_circle_rounded),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _selectedIndex == 2
                            ? Icon(Icons.shopping_cart)
                            : Icon(Icons.shopping_cart),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _selectedIndex == 3
                            ? Icon(Icons.history_rounded)
                            : Icon(Icons.history_rounded),
                      ),
                      label: ''),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

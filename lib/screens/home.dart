import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavSelectedIndex = 0;

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _bottomNavSelectedIndex = index;
    });
  }

  Widget _buildBottomNavCustomIcon(
      IconData icon, IconData activeIcon, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          _bottomNavSelectedIndex == index ? activeIcon : icon,
          color: _bottomNavSelectedIndex == index ? brownNormal : null,
        ),
        if (_bottomNavSelectedIndex == index)
          Container(
            decoration: BoxDecoration(
              color: brownNormal,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.only(top: 5),
            height: 5,
            width: 10,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildBottomNavCustomIcon(Icons.home_outlined, Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavCustomIcon(
                Icons.favorite_border, Icons.favorite, 1),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavCustomIcon(
                Icons.shopping_cart_outlined, Icons.shopping_cart, 2),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavCustomIcon(
                Icons.notifications_outlined, Icons.notifications, 3),
            label: 'Notifications',
          ),
        ],
        currentIndex: _bottomNavSelectedIndex,
        selectedIconTheme: const IconThemeData(
          size: 34,
          color: brownNormal,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 34,
          color: greyLighter,
        ),
        showSelectedLabels: false,
        onTap: _onBottomNavItemTapped,
      ),
    );
  }
}

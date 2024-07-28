import 'package:flutter/material.dart';

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

  Widget _buildIcon(IconData icon, IconData activeIcon, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          _bottomNavSelectedIndex == index ? activeIcon : icon,
          color:
              _bottomNavSelectedIndex == index ? const Color(0xFFC67C4E) : null,
        ),
        if (_bottomNavSelectedIndex == index)
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
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
            icon: _buildIcon(Icons.home_outlined, Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite_border, Icons.favorite, 1),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                Icons.shopping_cart_outlined, Icons.shopping_cart, 2),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                Icons.notifications_outlined, Icons.notifications, 3),
            label: 'Notifications',
          ),
        ],
        currentIndex: _bottomNavSelectedIndex,
        selectedIconTheme: const IconThemeData(
          size: 34,
          color: Color(0xFFC67C4E),
        ),
        unselectedIconTheme: const IconThemeData(
          size: 34,
          color: Color(0xFFA2A2A2),
        ),
        showSelectedLabels: false,
        onTap: _onBottomNavItemTapped,
      ),
    );
  }
}

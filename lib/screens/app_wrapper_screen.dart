import 'cart_screen.dart';
import 'notifications_screen.dart';
import 'favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../ui/colors.dart';
import 'home_screen.dart';

class AppWrapperScreen extends StatefulWidget {
  const AppWrapperScreen({super.key});

  @override
  State<AppWrapperScreen> createState() => _AppWrapperScreenState();
}

class _AppWrapperScreenState extends State<AppWrapperScreen> {
  int _bottomNavSelectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavouritesScreen(),
    const CartScreen(),
    const NotificationsScreen(),
  ];

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

  Widget _heroSection() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Color(0xFF4F9CD6),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(30.0))),
          child: Text("Hero Section"),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _buildBottomNavCustomIcon(Icons.home_outlined, Icons.home, 0),
          label: AppLocalizations.of(context)!.bottomNavItemHome,
        ),
        BottomNavigationBarItem(
          icon: _buildBottomNavCustomIcon(
              Icons.favorite_border, Icons.favorite, 1),
          label: AppLocalizations.of(context)!.bottomNavItemFavourites,
        ),
        BottomNavigationBarItem(
          icon: _buildBottomNavCustomIcon(
              Icons.shopping_cart_outlined, Icons.shopping_cart, 2),
          label: AppLocalizations.of(context)!.bottomNavItemCart,
        ),
        BottomNavigationBarItem(
          icon: _buildBottomNavCustomIcon(
              Icons.notifications_outlined, Icons.notifications, 3),
          label: AppLocalizations.of(context)!.bottomNavItemNotifications,
        ),
      ],
      selectedIconTheme: const IconThemeData(
        size: 34,
        color: brownNormal,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 34,
        color: greyLighter,
      ),
      selectedLabelStyle: const TextStyle(
        color: brownNormal,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        color: greyLighter,
        fontSize: 12,
      ),
      selectedItemColor: brownNormal,
      unselectedItemColor: greyLighter,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 12,
      // Set to the same size as unselectedFontSize
      unselectedFontSize: 12,
      // Set to the same size as selectedFontSize
      onTap: _onBottomNavItemTapped,
      currentIndex: _bottomNavSelectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _screens.elementAt(_bottomNavSelectedIndex),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

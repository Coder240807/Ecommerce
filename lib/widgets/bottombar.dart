import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/screens/wishlist_screen.dart';
import 'package:ecommerceapp/screens/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Navigator(
      key: const ValueKey('homeNav'),
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const HomeScreen()),
    ),
    Navigator(
      key: const ValueKey('wishlistNav'),
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const WishlistScreen()),
    ),
    Navigator(
      key: const ValueKey('profileNav'),
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

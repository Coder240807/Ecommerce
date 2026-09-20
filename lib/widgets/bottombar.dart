import 'package:ecommerceapp/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/home_screen.dart';
import 'package:ecommerceapp/wishlist_screen.dart';
import 'package:ecommerceapp/wishlist_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      Navigator(
        key: const ValueKey('homeNav'),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        },
      ),
      Navigator(
        key: const ValueKey('wishlistNav'),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const WishlistScreen(),
          );
        },
      ),
      Navigator(
        key: const ValueKey('cartNav'),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const CartScreen());
        },
      ),
      const Scaffold(body: Center(child: Text('Profile Screen'))),
    ];
  }

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

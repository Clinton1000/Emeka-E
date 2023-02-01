import 'package:changecollect/pages/main_screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:changecollect/pages/main_screens/wallet.dart';
import 'package:changecollect/pages/main_screens/markets.dart';
import 'package:changecollect/pages/main_screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = 'Bottom_Nav_Bar';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Homepage(),
    const Wallet(),
    const Markets(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color(0xff3964ff),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_bitcoin), label: 'Markets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

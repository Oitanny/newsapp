import 'package:flutter/material.dart';
import 'package:newsapp/presentation/screens/homepage.dart';
import 'package:newsapp/presentation/screens/login.dart';
import 'package:newsapp/presentation/screens/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    LoginPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _screens[_selectedIndex],
      bottomNavigationBar:    ClipRRect(

        borderRadius: BorderRadius.circular(20.0),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

          backgroundColor: Color(0xFFD3D3D3),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF1a1a1a),),
              label: '', // Empty label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined, color: Color(0xFF1a1a1a),),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Color(0xFF1a1a1a),),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

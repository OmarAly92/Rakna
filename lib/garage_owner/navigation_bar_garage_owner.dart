import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakna/garage_owner/setting_screen_owner.dart';

import 'finance.dart';
import 'garage_owner_home_screen.dart';

class NavigationBarGarageOwner extends StatefulWidget {
  const NavigationBarGarageOwner({super.key});

  @override
  State<NavigationBarGarageOwner> createState() => _NavigationBarGarageOwnerState();
}

class _NavigationBarGarageOwnerState extends State<NavigationBarGarageOwner> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    GarageOwnerHomeScreen(),
    SettingScreenGarageOwner(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Parking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

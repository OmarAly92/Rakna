import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';

import '../../garage_owner/book_mark.dart';
import 'booking_state_screen.dart';
import 'home_screen.dart';


class NavigationBarScreen extends StatefulWidget {
   NavigationBarScreen({super.key,  required this.userID,this.screenIndex =0});
  int screenIndex;
  final int userID;





  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      widget.screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: [
          HomeScreen(userId: widget.userID),

          const BookingState(),
          BookMark(),
          SettingScreen( userID: widget.userID),
        ].elementAt(widget.screenIndex),
      ),
      bottomNavigationBar:


      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'BookMark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: widget.screenIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

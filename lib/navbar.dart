import 'package:flutter/material.dart';
import 'package:tugasakhir/about.dart';
import 'package:tugasakhir/homepage.dart';
import 'package:tugasakhir/profile.dart';
import 'other.dart';
import 'login.dart';



class botnavbar extends StatefulWidget {
  @override
  _botnavbarState createState() => _botnavbarState();
}

class _botnavbarState extends State<botnavbar> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    ProfilePage(),
    About(),
    Other(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.red,
         type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new_sharp),
            label: 'Other',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Container(
                child: Icon(Icons.logout),
              ),
            ),
            label: 'Log out',
          ),
        ],
      ),
    );
  }
}





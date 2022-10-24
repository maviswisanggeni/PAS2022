import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:project_pas/screens/home.dart';
import 'package:project_pas/utils/constant.dart';

class Navigation extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedTab = _SelectedTab.home;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(child: Text('Index 1: Favorites')),
    Center(child: Text('Index 2: Cart')),
    Center(child: Text('Index 3: User')),
  ];

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        child: _widgetOptions.elementAt(_selectedTab.index),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          backgroundColor: Styles.primaryColor,
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Styles.white,
          unselectedItemColor: Styles.lightBrown,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              selectedColor: Styles.white,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              selectedColor: Styles.white,
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              selectedColor: Styles.white,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              selectedColor: Styles.white,
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, likes, search, profile }
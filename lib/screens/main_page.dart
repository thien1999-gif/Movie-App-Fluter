import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screens/movie/movie_screen.dart';
import 'package:movieapp/screens/tv/tv_screen.dart';
import 'package:movieapp/style/theme.dart' as Style;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Movie_Screen(),
    TVScreen(),
    Text('Add 2', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Cinematic Universe"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.searchOutline,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            title: Text('Movie'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            title: Text('TV show'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add2'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
      ),
    );
  }
}

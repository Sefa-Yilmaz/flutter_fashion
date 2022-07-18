import 'package:flutter/material.dart';
import 'package:flutter_fashion/ui/favorite_page.dart';
import 'package:flutter_fashion/ui/home_page.dart';
import 'package:flutter_fashion/ui/settings_page.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int selectedIndex = 0;

  List<Widget> _screans = [
    HomePage(),
    FavoritePage(),
    SettingsPage(),
  ];

  void updateMenuIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/menu.png',
          height: 40,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/search.png'),
          )
        ],
      ),
      body: _screans[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: updateMenuIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ev'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favori'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Ayarlar'),
        ],
      ),
    );
  }
}

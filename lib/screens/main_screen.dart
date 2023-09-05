import 'package:ecommerce/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'favourite_page.dart';
import 'home_page2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final List<Widget> tabList = [
    const HomePage2(),
    const FavouritePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            tabList.elementAt(pageIndex),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Align(
                alignment: const Alignment(0.0, 1.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    child: BottomNavigationBar(
                      selectedItemColor: Colors.black,
                      unselectedItemColor: Colors.grey,
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      backgroundColor: Colors.white,
                      currentIndex: pageIndex,
                      onTap: (int index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: const Icon(Icons.home),
                          label: 'Home',
                          backgroundColor: Colors.grey[200],
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.grey[200],
                          icon: const Icon(Icons.favorite),
                          label: 'Fav',
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.grey[200],
                          icon: const Icon(Icons.settings),
                          label: 'Settings',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/Browser/browser_screen.dart';
import 'package:movies_app/Homescreen/home_screen.dart';
import 'package:movies_app/SearchScreen/search-screen.dart';
import 'package:movies_app/Theme/my_theme.dart';
import 'package:movies_app/WatchList/watch_list.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'mainscreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> taps = [
    HomeScreen(),
    Container(),
    BrowserScreen(),
   WatchList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyTheme.primaryColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) async {
            if (index == 1) {
              await showSearch(
                context: context,
                delegate: SearchScreen(),
              );
              return; // ما نغيرش selectedIndex
            }
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'WatchList',
            ),
          ],
        ),
      ),
    );
  }
}

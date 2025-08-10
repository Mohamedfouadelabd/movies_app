
import 'package:flutter/material.dart';
import 'package:movies_app/Browser/browser_screen.dart';
import 'package:movies_app/Homescreen/home_screen.dart';
import 'package:movies_app/SearchScreen/search-screen.dart';
import 'package:movies_app/Theme/my_theme.dart';
import 'package:movies_app/WatchList/watch_list.dart';

class MainScreen extends StatefulWidget {
  static const String routeName='mainscreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Theme(
       data: Theme.of(context).copyWith(
         canvasColor: MyTheme.primaryColor
       ),
        child: BottomNavigationBar(
         currentIndex: selectedIndex,
          onTap: (index){
           selectedIndex=index;
        setState(() {

        });
         },
          items: [
            BottomNavigationBarItem(
              icon:ImageIcon( AssetImage('assets/images/Home icon.png',),
              size: 30,

              ),
label: 'Home'

            ),
            BottomNavigationBarItem(
                icon:ImageIcon( AssetImage('assets/images/search.png',),
                  size: 30,

                ),
                label: 'Search'

            ),
            BottomNavigationBarItem(
                icon:ImageIcon( AssetImage('assets/images/Icon material-movie.png',),
                  size: 30,

                ),
                label: 'Browse'

            ),
            BottomNavigationBarItem(
                icon:ImageIcon( AssetImage('assets/images/Icon ionic-md-bookmarks.png',),
                  size: 30,

                ),
                label: 'WatchList'

            ),
          ],
        ),
      ),
body: taps[selectedIndex],


    );
  }

List<Widget>taps=[
  HomeScreen(),
  SearchScreen(),
  BrowserScreen(),
  WatchList(),

];
}

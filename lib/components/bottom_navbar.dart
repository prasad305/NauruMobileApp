import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/homepage.dart';
import '../screens/newspage.dart';
import '../screens/search.dart';


class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0); //Page Controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index){
              //_pageController.animateToPage(index, duration: Duration(microseconds: 1000), curve: Curves.ease);
              setState(() {
                _pageController.animateToPage(index, duration: Duration(microseconds: 400000), curve: Curves.ease);
                _currentIndex = index;
              });
            },
            children : [
              HomePage(),
              NewsAndFeedPage(url: "https://naurujudiciary.gov.nr/news-and-announcements/",),
              SearchPage(),
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color.fromARGB(255, 246, 197, 0),
            unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                // _pageController.animateToPage(index, duration: Duration(microseconds: 400000), curve: Curves.ease);
                _pageController.jumpToPage(index);
                // _pageController.jumpToPage(index);
                // _currentIndex = index;
              });
            },

            backgroundColor: Color(0xFF006de4),
            items:[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 30, color: Color.fromARGB(255, 255, 255, 255)),
                activeIcon: Icon(Icons.home_filled, size: 30, color: Color.fromARGB(255, 246, 197, 0)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded, size: 30, color: Color.fromARGB(255, 255, 255, 255)),
                activeIcon: Icon(Icons.newspaper_rounded, size: 30, color: Color.fromARGB(255, 246, 197, 0)),
                label: 'News',
              ),BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera_front_rounded, size: 30, color: Color.fromARGB(255, 255, 255, 255)),
                activeIcon: Icon(Icons.photo_camera_front_rounded, size: 30, color: Color.fromARGB(255, 246, 197, 0)),
                label: 'My Case List',
              )
            ]
        )
    );
  }
}
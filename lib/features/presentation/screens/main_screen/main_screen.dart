import 'package:clean/const.dart';
import 'package:clean/features/presentation/screens/activity/activity_screen.dart';
import 'package:clean/features/presentation/screens/home/home_screen.dart';
import 'package:clean/features/presentation/screens/post/upload_post_screen.dart';
import 'package:clean/features/presentation/screens/profile/profile_screen.dart';
import 'package:clean/features/presentation/screens/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatefulWidget {
  final String uid;
  const MainScreen({super.key, required this.uid});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }


  void onPageChanged(int  index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: backGroundColor,
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.home,
            color: primaryColor,
            ),
            label: ''
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.search,
            color: primaryColor,
            ),
            label: ''
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.add_circle,
            color: primaryColor,
            ),
            label: ''
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.favorite,
            color: primaryColor,
            ),
            label: ''
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.person,
            color: primaryColor,
            ),
            label: ''
            ),
            
        ],
        onTap: navigationTapped,
        ),

        body: PageView(
          controller: pageController,
          children: [
            HomeScreen(),
            SearchScreen(),
            UploadPostScreen(),
            ActivityScreen(),
            ProfileScreen(),
          ],
          onPageChanged: onPageChanged,
        ),
    );
  }
}
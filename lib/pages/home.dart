import 'package:flutter/material.dart';
import 'package:fudeo_test_ansa/pages/last_hour.dart';
import 'package:fudeo_test_ansa/pages/historic_new.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/ansa_logo.png',
          height: 60,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          LastHourPage(),
          HistoryNewsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.linear);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: ('Ultima ora'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: ('Passati'),
          ),
        ],
      ),
    );
  }
}

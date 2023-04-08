import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'addRecordPage.dart';
import 'graph.dart';
import 'history.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab=0;
  Widget _currentScreen=GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Track Your Weight")),
      body:_currentScreen,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,

        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
          Get.to(addRecordView());
          });;
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(height:Get.height/12,gapLocation: GapLocation.center,
        icons: [Icons.show_chart, Icons.history],
        backgroundColor: Colors.black,
        activeColor: Colors.teal,
        inactiveColor: Colors.deepOrange,
        activeIndex:_currentTab,
        iconSize: 26,
        onTap: (p0) {
          setState(() {
            _currentTab=p0;
            _currentTab==0?Get.to(GraphScreen()):Get.to(HistoryScreen());
          });
        },
      ),
    );
  }
}

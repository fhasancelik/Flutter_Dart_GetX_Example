import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'addRecordPage.dart';
import 'history.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {

  
  int _currentTab=0;
  Widget _currentScreen=GraphScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Graph")),
        body: Center(
          child: Text('Graph Screen'),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,

        child: Icon(Icons.add,color:Colors.deepOrange),
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

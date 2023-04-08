import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/record.dart';
import 'package:untitled/record_list_tile.dart';

import 'addRecordPage.dart';
import 'controller.dart';
import 'graph.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());
  int _currentTab=2;
  Widget _currentScreen=GraphScreen();

  @override
  Widget build(BuildContext context) {

    List<Record> records=_controller.records;
    Widget xx;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("History"),
          actions: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: xx=records.isEmpty
            ? Center(child: Container(child: Text('Please Add Some Items')))
            : ListView(
                physics: BouncingScrollPhysics(),
                children: records
                    .map((record) => RecordListTile(
                          record: record,
                        ))
                    .toList(),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,

          child: Icon(Icons.add,color: Colors.deepOrange),
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
          activeIndex:1,
          iconSize: 26,
          onTap: (p0) {
            setState(() {
              _currentTab=p0;
             _currentTab==p0?Get.to(GraphScreen()):_currentTab==1?HistoryScreen():null;
            });
          },
        ),

      ),

    );
  }
}

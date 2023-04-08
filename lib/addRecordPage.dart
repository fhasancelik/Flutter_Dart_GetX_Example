import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:untitled/history.dart';
import 'package:untitled/record.dart';

import 'controller.dart';
import 'graph.dart';

class addRecordView extends StatefulWidget {
  const addRecordView({Key? key}) : super(key: key);

  @override
  State<addRecordView> createState() => _addRecordViewState();
}

class _addRecordViewState extends State<addRecordView> {
  int _weightValue = 50;
  DateTime _selectedDate = DateTime.now();

  int _currentTab=0;
  Widget _currentScreen=GraphScreen();


  @override
  Widget build(BuildContext context) {
    final Controller _controller = Get.put(Controller());


    return Scaffold(
      appBar: AppBar(
        title: Text('Add Record'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.weight,
                    size: 40,
                  ),
                  Stack(alignment: Alignment.bottomCenter, children: [
                    GestureDetector(onTap: (){
                      setState(() {

                      });
                    },
                      child: NumberPicker(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          axis: Axis.horizontal,
                          itemCount: 3,
                          itemWidth: 80,
                          itemHeight: 50,
                          step: 1,
                          minValue: 30,
                          maxValue: 150,
                          value: _weightValue,
                          onChanged: (value) {
                            setState(() {
                              _weightValue = value;
                            });
                          }),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronUp,
                      size: 16,
                    )
                  ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{


              var initialDate = DateTime.now();
              _selectedDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: initialDate.subtract(Duration(days: 365)),
                  lastDate: initialDate.add(Duration(days: 30))) ??
                  _selectedDate;
              setState(() {



              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                        child: Text(
                      DateFormat('EEE,MMM d').format(_selectedDate),
                      textAlign: TextAlign.center,
                    )),

                  ],
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Text('Note Card'),
          ),
        ElevatedButton(
             onPressed: () {


                setState(() {
                  _controller.addRecord(_selectedDate,_weightValue);
              Get.to(HistoryScreen());


                });



             },
             child: Text('Save Record',style: TextStyle(fontSize: 20),),
             style: ElevatedButton.styleFrom(
               minimumSize: Size(200, 60),
               primary: Colors.black,
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(16)),
             ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,

        child: Icon(Icons.add,color: Colors.teal),
        onPressed: () {
          setState(() {
            Get.to(addRecordView());
          });;
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(height:Get.height/12,gapLocation: GapLocation.center,
        icons: [Icons.show_chart, Icons.history],
        backgroundColor: Colors.black,
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.deepOrange,
        activeIndex:_currentTab,
        iconSize: 26,
        onTap: (p0) {
          setState(() {
            _currentTab=p0;
            _currentScreen=(p0==0)?GraphScreen():HistoryScreen();
          });
        },
      ),

    );
  }
}

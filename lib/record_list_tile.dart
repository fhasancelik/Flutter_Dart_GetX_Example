import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:untitled/record.dart';

import 'controller.dart';
import 'history.dart';
import 'editRecord.dart';



class RecordListTile extends StatefulWidget {
  final Record record;
  RecordListTile({Key? key, required this.record}) : super(key: key);

  @override
  State<RecordListTile> createState() => _RecordListTileState();
}

class _RecordListTileState extends State<RecordListTile> {
  final Controller _controller=Get.find();
  int _weightValue = 50;
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: ListTile(
          leading: buildDate(),
          title: buildWeight(),
          trailing: builIcons(),
        ),
      ),
    );
  }

  Row builIcons() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
        onPressed: (){

        setState(() {

         Get.to(historyBodyView(newrec: widget.record));
        });


        },
        icon: Icon(
          Icons.edit,
          color: Colors.grey,
        ),
      ),
      IconButton(
        onPressed: (){
          _controller.deleteRecord(widget.record);

        }

        ,
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    ]);
  }

  Center buildWeight() => Center(
          child: Text(
        '${widget.record.weight}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ));

  Text buildDate() => Text(DateFormat('EEE,MMM,d').format(widget.record.dateTime));
}

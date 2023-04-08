import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/record.dart';
import 'addRecordPage.dart';

class Controller extends GetxController {

 int _weightValue = 50;
 var records=<Record>[


 ].obs;

 void addRecord(DateTime selectedDate,int weightValue){



   records.add(Record(dateTime:selectedDate,weight:weightValue,note: 'Axxxxx'));

 }

 void deleteRecord(Record record){

  records.remove(record);

 }



  }

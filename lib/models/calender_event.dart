import 'package:flutter/material.dart';

class CalenderEvent{

  String startTime;
  String endTime;
  int startIdx;
  int endIdx;
  String eventName;
  String eventCode;
  String size;
  String colorName;
  Color color;

  CalenderEvent(this.startTime,this.endTime,this.eventName,this.eventCode,this.size,this.colorName,this.color,this.startIdx,this.endIdx);

}
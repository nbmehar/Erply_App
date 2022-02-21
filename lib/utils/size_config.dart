import 'package:flutter/material.dart';

class SizeConfig{
  BuildContext context;
  late Size size;
  
  SizeConfig({required this.context}){
    size= MediaQuery.of(context).size;
  }
}
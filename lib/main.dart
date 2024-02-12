// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables

import 'package:introduction_screen/introduction_screen.dart';
import 'package:thailand_province_project/views/home_ui.dart';
import 'package:thailand_province_project/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    //call main widget MaterialApp()
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(), //เรียกหน้าจอแรกของแอป
    ),
  );
}
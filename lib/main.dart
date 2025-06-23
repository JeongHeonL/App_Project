import 'package:flutter/material.dart';
import 'Page/Mainpage.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    home: Mainpage(),
    debugShowCheckedModeBanner: false,
  ));
}
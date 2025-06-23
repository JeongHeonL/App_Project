import 'package:flutter/material.dart';
import 'menubar.dart';
// 
class myappbar extends StatelessWidget {
  
  final String title; 
  final Widget body;
  final Color appBarColor; 

  const myappbar({
    Key? key,
    required this.title,
    required this.body,
    this.appBarColor = const Color(0xffc4302b), // 기본 색깔
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle : true,
        title: Text(title), 
        backgroundColor: appBarColor, 
        foregroundColor: Colors.white,
      ),
      drawer: const Drawbar(),
      body: body,
    );
  }
}

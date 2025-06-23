import 'package:flutter/material.dart';
import '../bar/AnimatedButtonBox.dart';
import 'package:converter_app/Page/youtubeconverter_page.dart';
import '../bar/appbar.dart';
import 'edit_page.dart';


class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myappbar(
      title: "TubeTune", 
      appBarColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedButtonBox(
              label: '유튜브 음원 다운로드',
              color: const Color(0xffc4302b),
              targetPage: YoutubeConverter(),
            ),
            AnimatedButtonBox(
              label: '음원파일 편집',
              color: Colors.greenAccent,
              targetPage: editPage(),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../service/Converter_UI.dart';
import '../bar/appbar.dart';

class YoutubeConverter extends StatelessWidget {
  const YoutubeConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return myappbar(
      title: '유튜브 음원 다운로드',
      appBarColor: Colors.redAccent,
      
      body: const ConverterUI(
        title: '유튜브 링크를 입력해주세요',
        hint: '예시 : https://www.youtube.com/watch?v=...',
        buttonColor1: Colors.redAccent,
        buttonText1: 'MP3로 다운로드',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'appbar.dart';


class DownloadHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myappbar(
      title: "다운로드 기록", 
      appBarColor: Colors.black, 
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ), 
    ); 
  }
}

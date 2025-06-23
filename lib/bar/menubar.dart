import 'package:flutter/material.dart';
import 'notification.dart';
import 'download_history.dart';
import 'Terms.dart';
import 'setting.dart';
import '../Page/Mainpage.dart';

class Drawbar extends StatelessWidget {
  const Drawbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            '🎵 TubeTune',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
            ),
          ),
          const SizedBox(height: 40), // 앱 이름 아래 여백
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('홈'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Mainpage()),
                    );
                  },
                ),
                const Divider(),

                ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text('다운로드 기록'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  DownloadHistoryPage()),
                    );
                  },
                ),
                const Divider(),

                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('알림'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  NotificationPage()),
                    );
                  },
                ),
                const Divider(),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('환경설정'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SettingPage()),
                    );
                  },
                ),
                const Divider(),

                ListTile(
                  title: const Text('이용약관 및 개인정보처리방침'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TermsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

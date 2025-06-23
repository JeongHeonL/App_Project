import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomTabBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.cyan,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: '변환',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: '수정',
        ),
      ],
    );
  }
}

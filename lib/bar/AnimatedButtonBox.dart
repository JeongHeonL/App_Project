import 'package:flutter/material.dart';

class AnimatedButtonBox extends StatefulWidget {
  final String label;
  final Color color;
  final Widget targetPage;

  const AnimatedButtonBox({
    Key? key,
    required this.label,
    required this.color,
    required this.targetPage,
  }) : super(key: key);

  @override
  _AnimatedButtonBoxState createState() => _AnimatedButtonBoxState();
}

class _AnimatedButtonBoxState extends State<AnimatedButtonBox>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  Duration _duration = Duration(milliseconds: 110);

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => widget.targetPage),
    );
  }

  @override
  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return GestureDetector(
    onTapDown: _onTapDown,
    onTapUp: (details) {
      _onTapUp(details);
      Future.delayed(_duration, _navigate);
    },
    onTapCancel: _onTapCancel,
    child: AnimatedScale(
      scale: _scale,
      duration: _duration,
      curve: Curves.bounceIn,
      child: Container(
        width: screenWidth * 0.6, // 화면 너비의 60%
        height: screenHeight * 0.15, // 화면 높이의 15%
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

  
}

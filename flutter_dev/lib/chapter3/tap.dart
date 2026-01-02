import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Counter(),
    ),
  );
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  final _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        print('tapped!');
      },
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            '$_count',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
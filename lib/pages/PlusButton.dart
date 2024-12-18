import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  final Function function;

  PlusButton({required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      borderRadius: BorderRadius.circular(300000),
      child: Ink(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}

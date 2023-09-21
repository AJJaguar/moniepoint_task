import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final double? fontSize;
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0XFFF17922),
            borderRadius: BorderRadius.circular(30.0)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
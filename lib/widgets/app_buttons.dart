import 'package:flutter/material.dart';
import 'package:travel_app_bloc/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
    this.text,
    this.icon,
  });
  final String? text;
  final IconData? icon;
  final bool isIcon;
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isIcon
          ? Icon(
              icon,
              color: color,
            )
          : Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            ),
    );
  }
}

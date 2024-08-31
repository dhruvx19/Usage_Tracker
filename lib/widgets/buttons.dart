import 'package:flutter/material.dart';

Widget button(
  VoidCallback ontap,
  Color backgroundcolor,
  String text,
  double fontsize,
  double radius,
  Color color,
) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, color: color),
      ));
}

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Card(
        color: onPressed != null ? Colors.white24 : null,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              letterSpacing: 2,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

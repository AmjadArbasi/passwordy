import 'package:flutter/material.dart';

class CustomButtonsBuild extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonsBuild({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 40),
          backgroundColor: color,
          elevation: 0,
        ),
        child: Text(title),
      ),
    );
  }
}

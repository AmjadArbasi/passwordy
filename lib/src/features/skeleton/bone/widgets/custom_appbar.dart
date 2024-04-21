import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final Color titleColor;
  final double size;

  const CustomAppBar({
    super.key,
    required this.title,
    this.color = Colors.transparent,
    this.size = 56.0,
    this.titleColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      iconTheme: IconThemeData(
        color: titleColor,
        size: 30,
      ),
      centerTitle: true,
      backgroundColor: color,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}

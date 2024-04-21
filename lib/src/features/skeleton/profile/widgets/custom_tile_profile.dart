import 'package:flutter/material.dart';

class CustomTileProfile extends StatelessWidget {
  final IconData leadIcon;
  final String title;
  final void Function()? onTap;

  const CustomTileProfile({
    super.key,
    required this.leadIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(
            leadIcon,
            size: 25,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 25,
          ),
        ),
      ),
    );
  }
}

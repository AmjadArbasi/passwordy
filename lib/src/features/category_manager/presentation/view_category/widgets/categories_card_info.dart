import 'package:flutter/material.dart';

class CategroiesCardInfo extends StatelessWidget {
  final Color color;
  final int numberOfPassword;
  final String nameOfCategory;

  const CategroiesCardInfo({
    super.key,
    required this.color,
    required this.numberOfPassword,
    required this.nameOfCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 140, maxWidth: 160),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.background,
              radius: 30,
              child: Text(
                numberOfPassword.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                nameOfCategory,
                overflow: TextOverflow.fade,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

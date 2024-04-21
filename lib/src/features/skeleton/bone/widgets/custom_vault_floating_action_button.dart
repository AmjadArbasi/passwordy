import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:get/get.dart';

class CustomVaultFloatingActionButton extends StatelessWidget {
  const CustomVaultFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(AppRoutes.saveCatchword);
      },
      tooltip: "Add",
      child: const Icon(
        Icons.add,
      ),
    );
  }
}

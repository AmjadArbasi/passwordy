import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:get/get.dart';

class HomeCategoryBar extends StatelessWidget {
  const HomeCategoryBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Text(
            "homeCategoriesTitle".tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.saveCategory),
            icon: const Icon(
              Icons.settings,
              size: 28,
            ),
            color: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
    );
  }
}

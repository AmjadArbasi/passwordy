import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:get/get.dart';

class HomeCatchwordBar extends StatelessWidget {
  const HomeCatchwordBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "recentlyUsedHome".tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.saveCatchword);
            },
            child: Row(
              children: [
                Text(
                  "addItemHome".tr,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                const Icon(
                  Icons.add,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

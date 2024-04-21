import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:get/get.dart';

class CatchwordItem extends StatelessWidget {
  const CatchwordItem({
    super.key,
    required this.catchwordEntity,
    required this.categoryEntity,
  });

  final CatchwordEntity catchwordEntity;
  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        AppRoutes.viewCatchword,
        arguments: {
          'catchword': catchwordEntity,
          'category': categoryEntity,
        },
      ),
      child: Card(
        child: CatchwordListTile(
          catchword: catchwordEntity,
          category: categoryEntity,
        ),
      ),
    );
  }
}

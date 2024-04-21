import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CategoryAllSelection extends StatelessWidget {
  const CategoryAllSelection({
    super.key,
    required this.allCategories,
    required this.currentIndex,
  });

  final List<CategoryEntity> allCategories;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CatchwordBloc>().add(
              CatchwordsUpdateCategoriesRequested(
                filteredCategories: allCategories,
                currentIndex: -1,
              ),
            );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: -1 == currentIndex
              ? Theme.of(context).colorScheme.tertiary
              : Colors.transparent,
        ),
        child: Text(
          'allWordSelectionVault'.tr,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: -1 == currentIndex ? Colors.white : Colors.black,
              ),
        ),
      ),
    );
  }
}

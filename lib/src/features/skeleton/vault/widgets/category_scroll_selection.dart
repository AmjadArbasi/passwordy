import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CategoryScrollSelection extends StatelessWidget {
  const CategoryScrollSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCategoryIndex =
        context.select((CatchwordBloc bloc) => bloc.state.currentIndex);

    return BlocBuilder<CatchwordBloc, CatchwordState>(
      builder: (context, state) {
        return CategoryItemsSelected(
          categories: state.categories,
          currentCategoryIndex: currentCategoryIndex,
        );
      },
    );
  }
}

class CategoryItemsSelected extends StatelessWidget {
  const CategoryItemsSelected({
    super.key,
    required this.categories,
    required this.currentCategoryIndex,
  });

  final List<CategoryEntity> categories;
  final int currentCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItemSelected(
            currentCategoryIndex: currentCategoryIndex,
            index: index,
            categoryEntity: categories[index],
          );
        },
      ),
    );
  }
}

class CategoryItemSelected extends StatelessWidget {
  const CategoryItemSelected({
    super.key,
    required this.currentCategoryIndex,
    required this.index,
    required this.categoryEntity,
    this.categories,
  });

  final int currentCategoryIndex;
  final int index;
  final CategoryEntity categoryEntity;
  final List<CategoryEntity>? categories;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CatchwordBloc>().add(
              CatchwordsUpdateCategoriesRequested(
                filteredCategories: categories ?? [categoryEntity],
                currentIndex: index,
              ),
            );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index == currentCategoryIndex
              ? Theme.of(context).colorScheme.tertiary
              : Colors.transparent,
        ),
        child: Text(
          categoryEntity.categoryName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color:
                    index == currentCategoryIndex ? Colors.white : Colors.black,
              ),
        ),
      ),
    );
  }
}

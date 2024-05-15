import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CatchwordScrollView extends StatelessWidget {
  const CatchwordScrollView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: categories
          .expand((category) => category.catchwords.map((catchword) =>
              _buildCatchwordSliver(catchword, category, context)))
          .toList(),
    );
  }

  SliverToBoxAdapter _buildCatchwordSliver(
    CatchwordEntity catchword,
    CategoryEntity category,
    BuildContext context,
  ) {
    return SliverToBoxAdapter(
      child: Dismissible(
        key: Key(catchword.id.toString()),
        confirmDismiss: (direction) => _onDismissed(
          context,
          direction,
          catchword,
          category,
        ),
        background: slideRightEdit(),
        secondaryBackground: slideLeftDelete(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: InkWell(
            onTap: () {
              context
                  .read<CatchwordBloc>()
                  .add(CatchwordsUsingTrigger(id: catchword.id!));
              Get.toNamed(
                AppRoutes.viewCatchword,
                arguments: {'catchword': catchword, 'category': category},
              );
            },
            child: Card(
              child: CatchwordListTile(
                catchword: catchword,
                category: category,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onDismissed(BuildContext context, DismissDirection direction,
      CatchwordEntity catchword, CategoryEntity category) async {
    if (direction == DismissDirection.startToEnd) {
      Get.toNamed(
        AppRoutes.saveCatchword,
        arguments: {'catchword': catchword, 'category': category},
      );
      return false;
    } else {
      BlocProvider.of<CatchwordBloc>(context).add(
        CatchwordsDeleteRequested(
          catchword: catchword,
          category: category,
        ),
      );
      return true;
    }
  }

  Padding slideLeftDelete() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: const BoxDecoration(
          color: DismissibleColors.delete,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: 5,
        height: 20,
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Text(
                "deletePasswordCard".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding slideRightEdit() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: const BoxDecoration(
          color: DismissibleColors.edit,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 20),
              const Icon(Icons.edit, color: Colors.white),
              Text(
                "editPasswordCard".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CategoryScrollView extends StatelessWidget {
  const CategoryScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<ManageCategoryBloc, ManageCategoryState>(
        builder: (context, state) {
          if (state.status == ManageCategoryStatus.loading) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/loading_1.json',
                width: 150,
                height: 150,
              ),
            );
          }
          if (state.status == ManageCategoryStatus.failure) {
            logger.f(state.errorMessage);
            return Center(
              child: Lottie.asset(
                'assets/lottie/error.json',
                width: 150,
                height: 150,
              ),
            );
          }
          if (state.categories.isEmpty) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/empty.json',
                width: 150,
                height: 150,
              ),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return CategroiesCardInfo(
                color:
                    CategoryColors.colors[index % CategoryColors.colors.length],
                nameOfCategory: state.categories[index].categoryName,
                numberOfPassword: state.categories[index].total,
              );
            },
          );
        },
      ),
    );
  }
}

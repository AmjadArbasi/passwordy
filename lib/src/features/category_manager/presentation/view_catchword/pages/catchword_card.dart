import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

var logger = Logger();

class CatchwordCard extends StatelessWidget {
  const CatchwordCard({super.key, this.categories});
  final List<CategoryEntity>? categories;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CatchwordBloc, CatchwordState>(
          listenWhen: (previous, current) =>
              previous.lastDeletedItem != current.lastDeletedItem &&
              current.lastDeletedItem != null,
          listener: (context, state) {
            final deletedCatchword = state.lastDeletedItem!;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                _snackBarUndoDeletion(deletedCatchword.name, context),
              );
          },
        ),
        BlocListener<CatchwordBloc, CatchwordState>(
          listenWhen: (previous, current) =>
              previous.copiedPasscode != current.copiedPasscode,
          listener: (context, state) {
            logger.f(state.copiedPasscode);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    'PasswordCopied'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  backgroundColor: TAppTheme.success,
                ),
              );
          },
        ),
      ],
      child: BlocBuilder<CatchwordBloc, CatchwordState>(
        builder: (context, state) {
          if (state.status == CatchwordStatus.loading) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/loading_1.json',
                width: 150,
                height: 150,
              ),
            );
          } else if (state.status == CatchwordStatus.failure) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/error.json',
                width: 150,
                height: 150,
              ),
            );
          }
          if (state.catchwords.isEmpty) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/empty.json',
                width: 150,
                height: 150,
              ),
            );
          }
          return CatchwordScrollView(
            categories: categories ?? state.categories,
          );
        },
      ),
    );
  }

  SnackBar _snackBarUndoDeletion(String content, BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 12),
      padding: const EdgeInsets.all(10),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      content: Text(
        content,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
            ),
      ),
      action: SnackBarAction(
        label: "undoCatchwordDelete".tr,
        onPressed: () {
          logger.w(
            "[undo deleted catchword => ] ${context.read<CatchwordBloc>().state.lastDeletedItem}",
          );
          logger.w(
            "[undo deleted catchword => ] ${context.read<CatchwordBloc>().state.categoryLinkedDeletedCatchword}",
          );
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          context.read<CatchwordBloc>().add(
                const CatchwrodsUndoDeleteRequested(),
              );
        },
      ),
    );
  }
}

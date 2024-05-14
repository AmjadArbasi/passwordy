import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CatchwordView extends StatelessWidget {
  const CatchwordView({super.key});

  @override
  Widget build(BuildContext context) {
    late CatchwordEntity catchword;
    late CategoryEntity category;

    if (Get.arguments != null) {
      catchword = Get.arguments['catchword'];
      category = Get.arguments['category'];
    } else {
      Get.offAndToNamed(AppRoutes.home);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: 'nameOfCatchwordView'.tr,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<CatchwordBloc, CatchwordState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCardInfo(
                    title: 'namePasswordCard'.tr,
                    content: catchword.name,
                    catchwordEntity: catchword,
                    categoryEntity: category,
                  ),
                  CustomCardInfo(
                    title: 'accountIdPasswordCard'.tr,
                    content: catchword.accountId,
                    catchwordEntity: catchword,
                    categoryEntity: category,
                  ),
                  CustomCardInfo(
                    title: 'notesPasswordCard'.tr,
                    content: catchword.note,
                    catchwordEntity: catchword,
                    categoryEntity: category,
                  ),
                  CustomCardInfo(
                    title: 'passwordPasswordCard'.tr,
                    content: catchword.passcode,
                    isPassword: true,
                    catchwordEntity: catchword,
                    categoryEntity: category,
                  ),
                  // TODO: move formatter to data layer
                  CustomCardInfo(
                    title: 'createdAtPasswordCard'.tr,
                    content: TimeFormatter.dateFormatter(catchword.createdAt),
                    catchwordEntity: catchword,
                    categoryEntity: category,
                  ),
                  CustomCardInfo(
                    title: 'assignedCategoryPasswordCard'.tr,
                    content: category.categoryName,
                    catchwordEntity: catchword,
                    categoryEntity: category,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonIcon(
                        icon: Icons.edit,
                        name: 'editPasswordCard'.tr,
                        backgroundColor: DismissibleColors.edit,
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.saveCatchword,
                            arguments: {
                              'catchword': catchword,
                              'category': category
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      CustomButtonIcon(
                        icon: Icons.delete,
                        name: 'deletePasswordCard'.tr,
                        backgroundColor: DismissibleColors.delete,
                        onPressed: () {
                          BlocProvider.of<CatchwordBloc>(context).add(
                            CatchwordsDeleteRequested(
                              catchword: catchword,
                              category: category,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

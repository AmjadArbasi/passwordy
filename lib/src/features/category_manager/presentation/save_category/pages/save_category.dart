import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/constants/dismissible_colors/colors.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SaveCategory extends StatelessWidget {
  const SaveCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "nameOfManageCategory".tr,
        color: Colors.transparent,
      ),
      body: const SingleChildScrollView(child: SaveCategoryView()),
    );
  }
}

class SaveCategoryView extends StatelessWidget {
  const SaveCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'allCategoriesManageCategory'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.read<ManageCategoryBloc>().add(
                        ManageCategoryEditCleared(),
                      );
                  addCategoryBottomSheet(context);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          BlocConsumer<ManageCategoryBloc, ManageCategoryState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage,
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                GlobalVar.logger.f(state.errorMessage);
                CustomDialogs.showDialogWaring(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xff764abc),
                        child: Text(
                          state.categories[index].total.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(state.categories[index].categoryName),
                      trailing: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 100,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<ManageCategoryBloc>().add(
                                    ManageCategoryEdited(
                                        state.categories[index]));
                                editCategoryBottomSheet(
                                  context,
                                  state.categories[index],
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: DismissibleColors.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<ManageCategoryBloc>().add(
                                      ManageCategoryDeleted(
                                        state.categories[index].id!,
                                      ),
                                    );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: DismissibleColors.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(thickness: 0.1);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> addCategoryBottomSheet(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            height: 250,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'addNewCategoryTitleManageCategory'.tr,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                ListTile(
                  leading: const Icon(
                    Icons.account_tree_rounded,
                    size: 30,
                  ),
                  title: SizedBox(
                    height: Get.height * 0.09,
                    width: Get.width * 0.6,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<ManageCategoryBloc>().add(
                              ManageCategoryNameChanged(value),
                            );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ManageCategoryBloc>()
                            .add(const ManageCategorySubmitted());
                        // Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(120, 40),
                      ),
                      child: Text(
                        'addButtonManageCategory'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        fixedSize: const Size(120, 40),
                      ),
                      child: Text(
                        'closeButtonManageCategory'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> editCategoryBottomSheet(
    BuildContext context,
    CategoryEntity categoryEntity,
  ) {
    TextEditingController textEditingController =
        TextEditingController(text: categoryEntity.categoryName);
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            height: 250,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'editNewCategoryTitleManageCategory'.tr,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_tree_rounded,
                    size: 30,
                  ),
                  trailing: const Icon(Icons.home_work_outlined),
                  title: SizedBox(
                    height: Get.height * 0.09,
                    width: Get.width * 0.6,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<ManageCategoryBloc>().add(
                              ManageCategoryNameChanged(value),
                            );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ManageCategoryBloc>()
                            .add(const ManageCategorySubmitted());
                        // Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(120, 40),
                      ),
                      child: Text(
                        'editButtonManageCategory'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        fixedSize: const Size(120, 40),
                      ),
                      child: Text(
                        'closeButtonManageCategory'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

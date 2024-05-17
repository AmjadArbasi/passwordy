import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SaveCatchword extends StatelessWidget {
  const SaveCatchword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late CatchwordEntity catchword;
    late CategoryEntity category;

    if (Get.arguments != null) {
      category = Get.arguments['category'] as CategoryEntity;
      catchword = Get.arguments['catchword'] as CatchwordEntity;
    } else {
      catchword = CatchwordEntity(
        name: '',
        accountId: '',
        passcode: '',
        note: '',
      );
      category = const CategoryEntity();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditCatchwordBloc(
            catchword: catchword,
            category: category,
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
          ),
        ),
        BlocProvider(
          create: (context) => PasswordGeneratorBloc(
            generatePassword: context.read<GeneratePassword>(),
          )..add(
              const PasswordGeneratorBuilt(),
            ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PasswordGeneratorBloc, PasswordGeneratorState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == PasswordGeneratorStatus.failure) {
                if (!state.useLowercase ||
                    !state.useNumber ||
                    !state.useUppercase ||
                    !state.useSymbols) {
                  CustomDialogs.showDialogWaring(
                    context,
                    'WarningPasswordGeneratorSaveCatchword'.tr,
                  );
                }
              }
            },
          ),
          BlocListener<EditCatchwordBloc, EditCatchwordState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == EditCatchwordStatus.failure) {
                logger.f(state.errorMessage);
                CustomDialogs.showDialogWaring(context, state.errorMessage);
              }
              if (state.status == EditCatchwordStatus.success) {
                Get.back();
              }
            },
          )
        ],
        child: const SaveCatchwordView(),
      ),
    );
  }
}

class SaveCatchwordView extends StatelessWidget {
  const SaveCatchwordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "nameOfSaveCatchwordPage".tr,
        color: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Form(
            child: Column(
              children: [
                TextFormFieldName(
                    initialValue: context.read<EditCatchwordBloc>().state.name),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldEmail(
                  initialValue:
                      context.read<EditCatchwordBloc>().state.accountId,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldPasscode(
                  initialValue:
                      context.read<EditCatchwordBloc>().state.passcode,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldNote(
                    initialValue: context.read<EditCatchwordBloc>().state.note),
                /*
                  * [Password Generator] Part 
                  * using Slide Widget to represent 
                  * the number of current lenght of the password to be generated
                  * based on four uses
                */
                const PasswordGenerator(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.saveCategory);
                        },
                        icon: const Icon(
                          Icons.settings,
                          size: 30,
                        ),
                      ),
                      Text(
                        "categoriesTitleSaveCatchword".tr,
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                      const SizedBox(width: 10),
                      const DropDownMuneCategories(),
                    ],
                  ),
                ),
                const CustomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownMuneCategories extends StatelessWidget {
  const DropDownMuneCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatchwordBloc, CatchwordState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: _buidDropdownButton(state, context),
        );
      },
    );
  }

  DropdownButton<CategoryEntity> _buidDropdownButton(
      CatchwordState state, BuildContext context) {
    final currentCategory =
        context.select((EditCatchwordBloc bloc) => bloc.state.category);
    final validCurrentCategory =
        state.categories.contains(currentCategory) ? currentCategory : null;

    return DropdownButton<CategoryEntity>(
      value: validCurrentCategory,
      hint: Text("selectionCategoryeSaveCatchword".tr),
      items: state.categories.map<DropdownMenuItem<CategoryEntity>>((e) {
        return _buildDropdownItem(e, context);
      }).toList(),
      onChanged: (categoryEntity) =>
          _onCategoryChanged(context, categoryEntity),
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 16,
      ),
      underline: Container(),
      iconEnabledColor: Theme.of(context).colorScheme.primary,
      menuMaxHeight: 300,
    );
  }

  DropdownMenuItem<CategoryEntity> _buildDropdownItem(
      CategoryEntity e, BuildContext context) {
    return DropdownMenuItem<CategoryEntity>(
      value: e,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width * 0.3,
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.end,
          children: [
            Text(
              e.categoryName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const Divider(thickness: 0.2),
          ],
        ),
      ),
    );
  }

  void _onCategoryChanged(BuildContext context, CategoryEntity? value) {
    context
        .read<EditCatchwordBloc>()
        .add(EditCatchwordCategoryChanged(category: value!));
  }
}

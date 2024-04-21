import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CustomButtonsBuild(
          title: 'discardButtonSaveCatchword'.tr,
          color: Colors.grey.shade400,
          onPressed: () {
            context
                .read<PasswordGeneratorBloc>()
                .add(const PasswordGeneratorDisposeSubmitted());
            Get.back();
          },
        ),
        BlocBuilder<EditCatchwordBloc, EditCatchwordState>(
          builder: (context, state) {
            return _CustomButtonsBuild(
              title: 'saveButtonSaveCatchword'.tr,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                context.read<EditCatchwordBloc>().add(
                      const EditCatchwordSubmitted(),
                    );
                context
                    .read<PasswordGeneratorBloc>()
                    .add(const PasswordGeneratorDisposeSubmitted());
                Get.back();
              },
            );
          },
        ),
      ],
    );
  }
}

class _CustomButtonsBuild extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onPressed;
  const _CustomButtonsBuild({
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(120, 40),
          backgroundColor: color,
          elevation: 0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UseNumberWidget extends StatelessWidget {
  const UseNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PasswordGeneratorBloc, PasswordGeneratorState>(
        builder: (context, state) {
          final useNumber = context
              .select((PasswordGeneratorBloc bloc) => bloc.state.useNumber);
          return CheckboxListTile(
            title: Text('numbersPasswordGeneratorSaveCatchword'.tr),
            value: useNumber,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onChanged: (value) {
              context.read<PasswordGeneratorBloc>().add(
                    PasswordGeneratorNumberUsed(useNumber: value!),
                  );
            },
          );
        },
      ),
    );
  }
}

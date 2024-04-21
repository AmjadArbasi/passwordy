import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UseUppercaseWidget extends StatelessWidget {
  const UseUppercaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordGeneratorBloc, PasswordGeneratorState>(
      builder: (context, state) {
        final useUppercase = context
            .select((PasswordGeneratorBloc bloc) => bloc.state.useUppercase);
        return Expanded(
          child: CheckboxListTile(
            title: Text('uppercasePasswordGeneratorSaveCatchword'.tr),
            value: useUppercase,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onChanged: (value) {
              context.read<PasswordGeneratorBloc>().add(
                    PasswordGeneratorUppercaseUsed(useUppercase: value!),
                  );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UseLowercaseWidget extends StatelessWidget {
  const UseLowercaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PasswordGeneratorBloc, PasswordGeneratorState>(
        builder: (context, state) {
          final useLowercase = context
              .select((PasswordGeneratorBloc bloc) => bloc.state.useLowercase);
          return CheckboxListTile(
            title: Text('lowercasePasswordGeneratorSaveCatchword'.tr),
            value: useLowercase,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onChanged: (value) {
              context.read<PasswordGeneratorBloc>().add(
                    PasswordGeneratorLowercaseUsed(useLowercase: value!),
                  );
            },
          );
        },
      ),
    );
  }
}

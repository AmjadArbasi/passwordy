import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UseSymbolsWidget extends StatelessWidget {
  const UseSymbolsWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PasswordGeneratorBloc, PasswordGeneratorState>(
        builder: (context, state) {
          final useSymbols = context
              .select((PasswordGeneratorBloc bloc) => bloc.state.useSymbols);
          return CheckboxListTile(
            title: Text('symbolsPasswordGeneratorSaveCatchword'.tr),
            value: useSymbols,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onChanged: (value) {
              context.read<PasswordGeneratorBloc>().add(
                    PasswordGeneratorSymbolsUsed(useSymbols: value!),
                  );
            },
          );
        },
      ),
    );
  }
}

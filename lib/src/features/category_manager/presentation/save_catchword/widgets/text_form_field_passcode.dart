import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_application_passmanager/src/features/password_visiablity/password_visiablity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TextFormFieldPasscode extends StatefulWidget {
  const TextFormFieldPasscode({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  State<TextFormFieldPasscode> createState() => _TextFormFieldPasscodeState();
}

class _TextFormFieldPasscodeState extends State<TextFormFieldPasscode> {
  late TextEditingController textEditingControllerPasscode;
  @override
  void initState() {
    textEditingControllerPasscode =
        TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerPasscode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibiltyBloc, PasswordVisibiltyState>(
      builder: (context, state) {
        return BlocListener<PasswordGeneratorBloc, PasswordGeneratorState>(
          listenWhen: (previous, current) =>
              previous.password != current.password && current.password != '',
          listener: (context, state) {
            textEditingControllerPasscode.text = state.password;
            context.read<EditCatchwordBloc>().add(
                  EditCatchwordPasscodeChanged(
                    passcode: textEditingControllerPasscode.text,
                  ),
                );
            Logger().i(
                'Generated Passcode => ${textEditingControllerPasscode.text}');
          },
          child: TextFormField(
            controller: textEditingControllerPasscode,
            obscureText: state.isVisible,
            decoration: InputDecoration(
              icon: const Icon(Icons.password),
              iconColor: Theme.of(context).colorScheme.secondary,
              hintText: "passwordHintTextSaveCatchword".tr,
              labelText: "passwordLabelTextSaveCatchword".tr,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<EditCatchwordBloc>().add(
                        EditCatchwordValueCopied(
                          valueCopied: textEditingControllerPasscode.text,
                        ),
                      );
                  Logger().i(
                    context.read<EditCatchwordBloc>().state.valueCopied,
                  );
                },
                icon: const Icon(Icons.copy),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (value) {
              context.read<EditCatchwordBloc>().add(
                    EditCatchwordPasscodeChanged(passcode: value),
                  );
            },
          ),
        );
      },
    );
  }
}

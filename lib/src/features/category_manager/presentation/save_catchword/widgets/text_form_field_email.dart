import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TextFormFieldEmail extends StatefulWidget {
  const TextFormFieldEmail({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  State<TextFormFieldEmail> createState() => _TextFormFieldEmailState();
}

class _TextFormFieldEmailState extends State<TextFormFieldEmail> {
  late TextEditingController textEditingControllerEmail;
  @override
  void initState() {
    textEditingControllerEmail =
        TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingControllerEmail,
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        iconColor: Theme.of(context).colorScheme.secondary,
        hintText: "emailHintTextSaveCatchword".tr,
        labelText: "example@domain.com",
        suffixIcon: IconButton(
          onPressed: () {
            context.read<EditCatchwordBloc>().add(EditCatchwordValueCopied(
                valueCopied: textEditingControllerEmail.text));
          },
          icon: const Icon(Icons.copy),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (value) {
        context.read<EditCatchwordBloc>().add(
              EditCatchwordAccountIdChanged(accountId: value),
            );
      },
    );
  }
}

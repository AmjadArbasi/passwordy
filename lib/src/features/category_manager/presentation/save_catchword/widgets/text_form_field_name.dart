import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TextFormFieldName extends StatefulWidget {
  const TextFormFieldName({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  State<TextFormFieldName> createState() => _TextFormFieldNameState();
}

class _TextFormFieldNameState extends State<TextFormFieldName> {
  late TextEditingController textEditingControllerName;
  @override
  void initState() {
    textEditingControllerName =
        TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingControllerName,
      decoration: InputDecoration(
        icon: const Icon(Icons.info),
        iconColor: Theme.of(context).colorScheme.secondary,
        hintText: "nameHintTextSaveCatchword".tr,
        labelText: "nameLabelTextSaveCatchword".tr,
        suffixIcon: IconButton(
          onPressed: () {
            context.read<EditCatchwordBloc>().add(
                  EditCatchwordValueCopied(
                    valueCopied: textEditingControllerName.text,
                  ),
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
              EditCatchwordNameChanged(name: value),
            );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:get/get.dart';

class TextFormFieldNote extends StatefulWidget {
  const TextFormFieldNote({super.key});

  @override
  State<TextFormFieldNote> createState() => _TextFormFieldNoteState();
}

class _TextFormFieldNoteState extends State<TextFormFieldNote> {
  late TextEditingController textEditingControllerNote;
  @override
  void initState() {
    textEditingControllerNote = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        icon: const Icon(Icons.text_fields),
        iconColor: Theme.of(context).colorScheme.secondary,
        hintText: 'notesHintTextSaveCatchword'.tr,
        labelText: 'notesLabelTextSaveCatchword'.tr,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (value) {
        logger.f(value);
      },
    );
  }
}

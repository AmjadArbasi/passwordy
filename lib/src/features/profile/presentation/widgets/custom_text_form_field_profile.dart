import 'package:flutter/material.dart';

class CustomTextFormFieldProfile extends StatelessWidget {
  final IconData icon;
  final String initialData;
  final String label;
  final String hintText;
  final bool? isPassword;
  final TextInputType? keyboardType;

  const CustomTextFormFieldProfile({
    super.key,
    required this.icon,
    required this.initialData,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: isPassword! ? true : false,
        initialValue: initialData,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          filled: true,
          icon: Icon(
            icon,
            size: 33,
          ),
          border: const OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

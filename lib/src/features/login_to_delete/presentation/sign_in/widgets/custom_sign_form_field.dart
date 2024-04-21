import 'package:flutter/material.dart';

class CustomSignFormField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String labelText;
  final TextInputType inputType;
  final bool? isPassword;

  const CustomSignFormField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.labelText,
    required this.inputType,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          suffixIcon: Icon(icon),
          hintText: hintText,
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 25.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

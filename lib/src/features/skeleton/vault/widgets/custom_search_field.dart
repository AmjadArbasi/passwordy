import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          decoration: InputDecoration(
            hintText: "SearchFormVault".tr,
            filled: true,
            fillColor: const Color(0xfff1f1f1),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            prefixIconColor: Colors.grey.shade500,
          ),
          onChanged: (value) {
            context
                .read<CatchwordBloc>()
                .add(CatchwordsResultSearchReturned(value: value));
          },
        ),
      ),
    );
  }
}

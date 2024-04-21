import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:get/get.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserInfoView(),
          const SizedBox(height: 35.0),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "displayNameGeneral".tr,
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (displayName) {},
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Change Name'),
          )
        ],
      ),
    );
  }
}

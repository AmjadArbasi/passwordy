import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:get/get.dart';

class General extends StatelessWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: 'nameOfGeneral'.tr,
        color: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: const Column(
            children: [
              UserInfoView(),
              SizedBox(height: 35.0),
              UpdateUserInfoForm(),
            ],
          ),
        ),
      ),
    );
  }
}

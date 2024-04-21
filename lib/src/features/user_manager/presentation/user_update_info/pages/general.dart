import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:get/get.dart';

class General extends StatelessWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'nameOfGeneral'.tr,
        color: Colors.transparent,
      ),
      body: Container(
        child: const DisplayName(),
      ),
    );
  }
}

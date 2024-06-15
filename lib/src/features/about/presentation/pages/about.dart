import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'aboutTitlePage'.tr,
        color: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "aboutMessage".tr,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
            ),
            const Spacer(),
            const VerionsOfAppAbout(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

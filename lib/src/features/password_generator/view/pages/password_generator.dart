import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/view/widgets/widgets.dart';
import 'package:get/get.dart';

class PasswordGenerator extends StatelessWidget {
  const PasswordGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  "lengthPasswordGeneratorSaveCatchword".tr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SliderWidget(),
              const RegeneratePasswordWidget(),
              const VisibilityWidget(),
            ],
          ),
        ),
        const Row(
          children: [
            UseUppercaseWidget(),
            UseLowercaseWidget(),
          ],
        ),
        const Row(
          children: [
            UseSymbolsWidget(),
            UseNumberWidget(),
          ],
        ),
      ],
    );
  }
}

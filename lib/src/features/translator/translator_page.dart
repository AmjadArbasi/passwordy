import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './translator_controller.dart';

class TranslatorPage extends GetView<TranslatorController> {
  const TranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TranslatorController>();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'nameOfTranslatorPage'.tr,
        ),
        body: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              CustomListTileLanguage(
                controller: controller,
                lang: 'en',
                pathImage: 'assets/images/en.png',
                nameOfLang: 'nameOfLangEn'.tr,
              ),
              const Divider(thickness: 0.3),
              CustomListTileLanguage(
                controller: controller,
                lang: 'ar',
                pathImage: 'assets/images/ar.png',
                nameOfLang: 'nameOfLangAr'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTileLanguage extends StatelessWidget {
  const CustomListTileLanguage({
    super.key,
    required this.controller,
    required this.lang,
    required this.pathImage,
    required this.nameOfLang,
  });

  final TranslatorController controller;
  final String pathImage;
  final String nameOfLang;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: () => controller.changeLang(lang),
        child: ListTile(
          leading: Image.asset(pathImage, width: 40, height: 40),
          title: Text(nameOfLang),
          trailing: Icon(
            Icons.language_outlined,
            color: Theme.of(context).colorScheme.secondary,
            size: 25,
          ),
        ),
      ),
    );
  }
}

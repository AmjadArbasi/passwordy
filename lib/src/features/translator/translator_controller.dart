import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TranslatorController extends GetxController {
  late Locale language;
  final internalLocalService = Get.find<InternalLocalService>();

  ThemeData themeApp = TAppTheme.lightThemeEnglish;

  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    internalLocalService.sharedPreferences.setString('languageCode', codelang);
    themeApp = codelang == "ar"
        ? TAppTheme.lightThemeArabic
        : TAppTheme.lightThemeEnglish;

    Logger().f(locale);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? languageCode =
        internalLocalService.sharedPreferences.getString('languageCode');
    Logger().f(languageCode);
    if (languageCode == 'ar') {
      language = const Locale('ar');
      themeApp = TAppTheme.lightThemeArabic;
    } else if (languageCode == "en") {
      language = const Locale("en");
      themeApp = TAppTheme.lightThemeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      themeApp = TAppTheme.lightThemeEnglish;
    }
    super.onInit();
  }
}

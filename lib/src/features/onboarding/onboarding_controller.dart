import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class OnboardingController extends GetxController {
  final internalLocalService = Get.find<InternalLocalService>();
  late bool onboardingCompleted;

  @override
  void onInit() {
    onboardingCompleted =
        internalLocalService.sharedPreferences.getBool('onboardingCompleted') ??
            false;
    Logger().f(onboardingCompleted);
    super.onInit();
  }
}

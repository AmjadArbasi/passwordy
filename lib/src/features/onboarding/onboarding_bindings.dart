import 'package:get/get.dart';
import 'onboarding_controller.dart';

class OnboardingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}

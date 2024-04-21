import 'package:get/get.dart';
import './translator_controller.dart';

class TranslatorBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TranslatorController());
  }
}

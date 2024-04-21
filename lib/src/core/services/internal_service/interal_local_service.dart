import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalLocalService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<InternalLocalService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

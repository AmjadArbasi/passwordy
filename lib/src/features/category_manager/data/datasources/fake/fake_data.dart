import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class FakeData {
  Future<String> _loadAssets() async {
    return await rootBundle.loadString('assets/json/data.json');
  }

  Future<CategoriesModel> loadData() async {
    String jsonString = await _loadAssets();
    final jsonResponse = json.decode(jsonString);
    return CategoriesModel.fromJson(jsonResponse);
  }
}

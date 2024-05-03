import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  // Create an instance of Isar to use throughout the app.
  static Future<Isar> create() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [
        CategoryDbDtoSchema,
        CatchwordDbDtoSchema,
        CategoriesDbDtoSchema,
        UserLocalDtoSchema
      ],
      directory: dir.path,
    );
  }
}

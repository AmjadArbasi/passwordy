import 'package:logger/logger.dart';

class GlobalVar {
  GlobalVar._();

  static const String keySession = "session";
  static final logger = Logger();

  static const usernameCategories = '__user_categories_cache_key__';
  static const logsDBuser = '__logs_db_user_cache_key__';
  static const oldKey = 'old_key';
  static const authUser = "auth_user";
}

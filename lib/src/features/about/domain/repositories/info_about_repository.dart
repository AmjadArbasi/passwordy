import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';

abstract class InfoAboutRepository {
  Future<Either<Failure, String>> getLocalVersion();
}

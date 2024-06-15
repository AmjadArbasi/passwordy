import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';

class InfoAboutRepositoryImpl extends InfoAboutRepository {
  @override
  Future<Either<Failure, String>> getLocalVersion() async {
    try {
      final contents = await rootBundle.loadString('pubspec.yaml');
      final lines = contents.split('\n');
      late String version;

      for (var line in lines) {
        if (line.startsWith('version:')) {
          version = line.split(':')[1].trim();
        }
      }
      return Right(version);
    } catch (e) {
      return Left(AboutException("something-wrong"));
    }
  }
}

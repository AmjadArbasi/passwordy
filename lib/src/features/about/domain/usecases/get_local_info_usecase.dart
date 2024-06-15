import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';

class GetLocalInfoUsecase {
  GetLocalInfoUsecase({required this.infoAboutRepository});

  final InfoAboutRepository infoAboutRepository;

  Future<Either<Failure, String>> call() async =>
      await infoAboutRepository.getLocalVersion();
}

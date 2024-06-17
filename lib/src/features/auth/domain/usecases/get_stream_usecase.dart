import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class GetStreamUsecase {
  GetStreamUsecase({required this.iAuthRepository});

  final IAuthRepository iAuthRepository;

  Stream<UserLocalEntity> get stream => iAuthRepository.stream;
}

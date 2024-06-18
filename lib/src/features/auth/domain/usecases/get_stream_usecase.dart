import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:rxdart/rxdart.dart';

class GetStreamUsecase {
  GetStreamUsecase({required this.iAuthRepository});

  final IAuthRepository iAuthRepository;

  BehaviorSubject<UserLocalEntity> get streamController =>
      iAuthRepository.streamController;
}

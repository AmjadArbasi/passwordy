import 'package:flutter_application_passmanager/src/core/common/common.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';

class DisposeUsecase implements BaseParamsUsecase<void, NoParams> {
  DisposeUsecase({required this.iAuthRepository});

  final IAuthRepository iAuthRepository;

  @override
  void call(NoParams params) => iAuthRepository.dispose();
}

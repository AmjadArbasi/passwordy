import 'package:flutter_application_passmanager/src/core/common/common.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';

class CheckOnboardingUsecase implements IUseCase<bool, NoParams> {
  CheckOnboardingUsecase({required IAuthRepository iAuthRepository})
      : _iAuthRepository = iAuthRepository;

  final IAuthRepository _iAuthRepository;

  @override
  bool call(NoParams params) => _iAuthRepository.checkOnboardingCompleted();
}

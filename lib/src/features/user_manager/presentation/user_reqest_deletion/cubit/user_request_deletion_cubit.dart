import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

part 'user_request_deletion_state.dart';

class UserRequestDeletionCubit extends Cubit<UserRequestDeletionState> {
  UserRequestDeletionCubit({required UserManagementUsecase usecase})
      : _usecase = usecase,
        super(const UserRequestDeletionState());

  final UserManagementUsecase _usecase;

  Future<void> deleteUserAccountReqeusted() async {
    state.copyWith(status: UserRequestDeletionStatus.loading);
    final failureOrSuccess = await _usecase.deleteUser();

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(
        status: UserRequestDeletionStatus.failure,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(status: UserRequestDeletionStatus.success)),
    );
  }
}

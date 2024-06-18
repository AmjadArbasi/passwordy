import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

part 'user_request_deletion_state.dart';

class UserRequestDeletionCubit extends Cubit<UserRequestDeletionState> {
  UserRequestDeletionCubit({required DeleteUserUsecase deleteUserUsecase})
      : _deleteUserUsecase = deleteUserUsecase,
        super(const UserRequestDeletionState());

  final DeleteUserUsecase _deleteUserUsecase;

  Future<void> deleteUserAccountReqeusted() async {
    emit(state.copyWith(status: UserRequestDeletionStatus.loading));

    final failureOrSuccess = await _deleteUserUsecase.call(NoParams());

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(
        status: UserRequestDeletionStatus.failure,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(status: UserRequestDeletionStatus.success)),
    );
  }
}

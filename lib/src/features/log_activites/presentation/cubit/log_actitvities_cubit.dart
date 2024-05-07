import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/log_activites.dart';

part 'log_actitvities_state.dart';

class LogActitvitiesCubit extends Cubit<LogActitvitiesState> {
  LogActitvitiesCubit({required LogActivityUsecase usecase})
      : _usecase = usecase,
        super(const LogActitvitiesState());

  final LogActivityUsecase _usecase;

  Future<void> subscribeRequested() async {
    emit(state.copyWith(status: LogActitvitiesStatus.loading));

    final failureOrEntity = await _usecase.loadAllValues();
    failureOrEntity.fold(
      (failure) {
        emit(state.copyWith(
          status: LogActitvitiesStatus.failed,
          errorMessage: failure.message,
        ));
      },
      (logs) {
        emit(state.copyWith(
          status: LogActitvitiesStatus.success,
          logActivitiesEntity: logs,
        ));
      },
    );
  }

  Future<void> clearAll() async {
    emit(state.copyWith(status: LogActitvitiesStatus.loading));

    final failureOrSuccess = await _usecase.deleteAll();
    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: LogActitvitiesStatus.failed,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(status: LogActitvitiesStatus.success));
      },
    );
  }
}

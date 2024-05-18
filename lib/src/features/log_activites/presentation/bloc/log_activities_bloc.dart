import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/log_activites.dart';

part 'log_activities_event.dart';
part 'log_activities_state.dart';

class LogActivitiesBloc extends Bloc<LogActivitiesEvent, LogActivitiesState> {
  LogActivitiesBloc({required LogActivityUsecase usecase})
      : _usecase = usecase,
        super(const LogActivitiesState()) {
    on<LogActivitiesCleared>(_onCleared);
    on<LogActivitiesSubscibeRequested>(_onSubscibeRequested);
    on<LogActivitiesRefreshRequested>(_onRefreshRequested);
  }

  final LogActivityUsecase _usecase;

  Future<void> _onRefreshRequested(
    LogActivitiesRefreshRequested event,
    Emitter<LogActivitiesState> emit,
  ) async {
    emit(state.copyWith(status: LogActivitiesStatus.loading));

    final result = await _usecase.refreshData();

    result.fold(
        (failure) => emit(state.copyWith(
              status: LogActivitiesStatus.failed,
              errorMessage: failure.message,
            )),
        (_) => emit(state.copyWith(status: LogActivitiesStatus.success)));
  }

  Future<void> _onSubscibeRequested(
    LogActivitiesSubscibeRequested event,
    Emitter<LogActivitiesState> emit,
  ) async {
    emit(state.copyWith(status: LogActivitiesStatus.loading));

    await emit.forEach(
      _usecase.logs(),
      onData: (data) => state.copyWith(
        logActivitiesEntity: data,
        status: LogActivitiesStatus.success,
      ),
      onError: (error, _) => state.copyWith(
        status: LogActivitiesStatus.failed,
        errorMessage: error.toString(),
      ),
    );
  }

  Future<void> _onCleared(
    LogActivitiesCleared event,
    Emitter<LogActivitiesState> emit,
  ) async {
    emit(state.copyWith(status: LogActivitiesStatus.loading));

    final failureOrSuccess = await _usecase.deleteAll();
    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: LogActivitiesStatus.failed,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(status: LogActivitiesStatus.success));
      },
    );
  }

  @override
  Future<void> close() {
    _usecase.dispose();
    return super.close();
  }
}

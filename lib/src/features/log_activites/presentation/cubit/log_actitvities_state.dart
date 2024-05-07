part of 'log_actitvities_cubit.dart';

enum LogActitvitiesStatus { initial, success, failed, loading }

final class LogActitvitiesState extends Equatable {
  const LogActitvitiesState({
    this.status = LogActitvitiesStatus.initial,
    this.errorMessage = "",
    this.logActivitiesEntity,
  });

  @override
  List<Object?> get props => [status, errorMessage, logActivitiesEntity];

  final LogActitvitiesStatus status;
  final String errorMessage;
  final List<LogActivityEntity>? logActivitiesEntity;

  LogActitvitiesState copyWith({
    LogActitvitiesStatus? status,
    String? errorMessage,
    List<LogActivityEntity>? logActivitiesEntity,
  }) {
    return LogActitvitiesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      logActivitiesEntity: logActivitiesEntity ?? this.logActivitiesEntity,
    );
  }
}

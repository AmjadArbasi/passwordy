part of 'log_activities_bloc.dart';

enum LogActivitiesStatus { initial, success, failed, loading }

final class LogActivitiesState extends Equatable {
  const LogActivitiesState({
    this.status = LogActivitiesStatus.initial,
    this.errorMessage = "",
    this.logActivitiesEntity,
  });

  final LogActivitiesStatus status;
  final String errorMessage;
  final List<LogActivityEntity>? logActivitiesEntity;

  @override
  List<Object?> get props => [status, errorMessage, logActivitiesEntity];

  LogActivitiesState copyWith({
    LogActivitiesStatus? status,
    String? errorMessage,
    List<LogActivityEntity>? logActivitiesEntity,
  }) {
    return LogActivitiesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      logActivitiesEntity: logActivitiesEntity ?? this.logActivitiesEntity,
    );
  }
}

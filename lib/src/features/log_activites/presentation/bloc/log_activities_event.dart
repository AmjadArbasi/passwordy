part of 'log_activities_bloc.dart';

sealed class LogActivitiesEvent extends Equatable {
  const LogActivitiesEvent();

  @override
  List<Object> get props => [];
}

final class LogActivitiesRefreshRequested extends LogActivitiesEvent {
  const LogActivitiesRefreshRequested();

  @override
  List<Object> get props => [];
}

final class LogActivitiesSubscibeRequested extends LogActivitiesEvent {
  const LogActivitiesSubscibeRequested();

  @override
  List<Object> get props => [];
}

final class LogActivitiesCleared extends LogActivitiesEvent {
  const LogActivitiesCleared();

  @override
  List<Object> get props => [];
}

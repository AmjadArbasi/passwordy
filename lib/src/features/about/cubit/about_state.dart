part of 'about_cubit.dart';

enum AboutStatus { initial, loading, success, failed }

final class AboutState extends Equatable {
  const AboutState({this.version = "", this.status = AboutStatus.initial});

  final String version;
  final AboutStatus status;

  @override
  List<Object> get props => [version, status];

  AboutState copyWith({
    String? version,
    AboutStatus? status,
  }) {
    return AboutState(
      version: version ?? this.version,
      status: status ?? this.status,
    );
  }
}

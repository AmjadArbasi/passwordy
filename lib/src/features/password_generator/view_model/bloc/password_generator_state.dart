part of 'password_generator_bloc.dart';

enum PasswordGeneratorStatus { initial, loading, success, failure }

final class PasswordGeneratorState extends Equatable {
  const PasswordGeneratorState({
    this.password = '',
    this.status = PasswordGeneratorStatus.initial,
    this.useUppercase = true,
    this.useLowercase = true,
    this.useSymbols = true,
    this.useNumber = true,
    this.length = 8,
  });

  final String password;
  final PasswordGeneratorStatus status;
  final bool useUppercase;
  final bool useLowercase;
  final bool useSymbols;
  final bool useNumber;
  final int length;

  @override
  List<Object> get props => [
        password,
        status,
        useLowercase,
        useSymbols,
        useUppercase,
        useNumber,
        length,
      ];

  PasswordGeneratorState copyWith({
    String? password,
    PasswordGeneratorStatus? status,
    bool? useUppercase,
    bool? useLowercase,
    bool? useSymbols,
    bool? useNumber,
    int? length,
  }) {
    return PasswordGeneratorState(
      password: password ?? this.password,
      status: status ?? this.status,
      useUppercase: useUppercase ?? this.useUppercase,
      useLowercase: useLowercase ?? this.useLowercase,
      useSymbols: useSymbols ?? this.useSymbols,
      useNumber: useNumber ?? this.useNumber,
      length: length ?? this.length,
    );
  }
}

part of 'password_generator_bloc.dart';

sealed class PasswordGeneratorEvent extends Equatable {
  const PasswordGeneratorEvent();

  @override
  List<Object> get props => [];
}

final class PasswordGeneratorBuilt extends PasswordGeneratorEvent {
  const PasswordGeneratorBuilt();
}

final class PasswordGeneratorUppercaseUsed extends PasswordGeneratorEvent {
  final bool useUppercase;

  const PasswordGeneratorUppercaseUsed({required this.useUppercase});
  @override
  List<Object> get props => [useUppercase];
}

final class PasswordGeneratorLowercaseUsed extends PasswordGeneratorEvent {
  final bool useLowercase;

  const PasswordGeneratorLowercaseUsed({required this.useLowercase});
  @override
  List<Object> get props => [useLowercase];
}

final class PasswordGeneratorSymbolsUsed extends PasswordGeneratorEvent {
  final bool useSymbols;

  const PasswordGeneratorSymbolsUsed({required this.useSymbols});
  @override
  List<Object> get props => [useSymbols];
}

final class PasswordGeneratorNumberUsed extends PasswordGeneratorEvent {
  final bool useNumber;

  const PasswordGeneratorNumberUsed({required this.useNumber});
  @override
  List<Object> get props => [useNumber];
}

final class PasswordGeneratorNumberLengthUsed extends PasswordGeneratorEvent {
  final int length;

  const PasswordGeneratorNumberLengthUsed({required this.length});
  @override
  List<Object> get props => [length];
}

final class PasswordGeneratorsubmitted extends PasswordGeneratorEvent {
  final String submitPass;

  const PasswordGeneratorsubmitted({required this.submitPass});

  @override
  List<Object> get props => [submitPass];
}

final class PasswordGeneratorDisposeSubmitted extends PasswordGeneratorEvent {
  const PasswordGeneratorDisposeSubmitted();
}

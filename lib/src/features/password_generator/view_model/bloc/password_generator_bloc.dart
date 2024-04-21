import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';

part 'password_generator_event.dart';
part 'password_generator_state.dart';

class PasswordGeneratorBloc
    extends Bloc<PasswordGeneratorEvent, PasswordGeneratorState> {
  PasswordGeneratorBloc({required GeneratePassword generatePassword})
      : _generatePassword = generatePassword,
        super(const PasswordGeneratorState()) {
    on<PasswordGeneratorBuilt>(_onBuilt);
    on<PasswordGeneratorUppercaseUsed>(_onUppercaseUsed);
    on<PasswordGeneratorLowercaseUsed>(_onLowercaseUsed);
    on<PasswordGeneratorSymbolsUsed>(_onSymbolsUsed);
    on<PasswordGeneratorNumberUsed>(_onNumberUsed);
    on<PasswordGeneratorNumberLengthUsed>(_onNumberLengthUsed);
    on<PasswordGeneratorsubmitted>(_onSubmitted);
    on<PasswordGeneratorDisposeSubmitted>(_onrDisposeSubmitted);
  }

  final GeneratePassword _generatePassword;

  Future<void> _onBuilt(PasswordGeneratorBuilt event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(status: PasswordGeneratorStatus.loading));
    _generatePassword.init();
    await emit.forEach<String>(
      _generatePassword.getGeneratedPassword(),
      onData: (data) => state.copyWith(
        password: data,
        status: PasswordGeneratorStatus.success,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: PasswordGeneratorStatus.failure,
      ),
    );
  }

  Future<void> _onUppercaseUsed(PasswordGeneratorUppercaseUsed event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(useUppercase: event.useUppercase));
  }

  Future<void> _onLowercaseUsed(PasswordGeneratorLowercaseUsed event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(useLowercase: event.useLowercase));
  }

  Future<void> _onSymbolsUsed(PasswordGeneratorSymbolsUsed event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(useSymbols: event.useSymbols));
  }

  Future<void> _onNumberUsed(PasswordGeneratorNumberUsed event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(useNumber: event.useNumber));
  }

  Future<void> _onNumberLengthUsed(PasswordGeneratorNumberLengthUsed event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(length: event.length));
  }

  Future<void> _onSubmitted(PasswordGeneratorsubmitted event,
      Emitter<PasswordGeneratorState> emit) async {
    emit(state.copyWith(status: PasswordGeneratorStatus.loading));
    try {
      final password = await _generatePassword.generatePassword(
        useLowercase: state.useLowercase,
        length: state.length,
        useSymbols: state.useSymbols,
        useUppercase: state.useUppercase,
        useNumber: state.useNumber,
      );

      emit(state.copyWith(
        status: PasswordGeneratorStatus.success,
        password: password,
      ));
    } catch (_) {
      emit(state.copyWith(status: PasswordGeneratorStatus.failure));
    }
  }

  Future<void> _onrDisposeSubmitted(PasswordGeneratorDisposeSubmitted event,
      Emitter<PasswordGeneratorState> emit) async {
    _generatePassword.dispose();
    emit(state.copyWith(status: PasswordGeneratorStatus.success));
  }
}

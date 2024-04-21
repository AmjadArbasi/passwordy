import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_visibilty_event.dart';
part 'password_visibilty_state.dart';

class PasswordVisibiltyBloc
    extends Bloc<PasswordVisibiltyEvent, PasswordVisibiltyState> {
  PasswordVisibiltyBloc(bool isVisible)
      : super(
          PasswordVisibiltyState(isVisible: isVisible),
        ) {
    on<PasswordVisibitlyToggled>(_onToggle);
  }

  Future<void> _onToggle(PasswordVisibitlyToggled event,
      Emitter<PasswordVisibiltyState> emit) async {
    emit(state.copyWith(isVisible: !state.isVisible));
  }
}

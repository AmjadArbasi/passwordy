import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

part 'show_user_info_state.dart';

class ShowUserInfoCubit extends Cubit<ShowUserInfoState> {
  ShowUserInfoCubit({
    required GetStreamUsecase streamUsecase,
  })  : _streamUsecase = streamUsecase,
        super(const ShowUserInfoState()) {
    _streamUsecase.streamController.listen((user) => getUser(user));
  }

  final GetStreamUsecase _streamUsecase;

  Future<void> getUser(UserLocalEntity user) async {
    emit(state.copyWith(user: user));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(const AboutState());

  Future<void> getCurrentVersio() async {
    emit(state.copyWith(status: AboutStatus.loading));

    try {
      String version =
          await rootBundle.loadString('assets/version/version.txt');

      emit(
          state.copyWith(status: AboutStatus.success, version: version.trim()));
    } catch (e) {
      Logger().e(e);
      emit(state.copyWith(status: AboutStatus.failed));
    }
  }
}

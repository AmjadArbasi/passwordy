import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit({required GetLocalInfoUsecase getLocalInfoUsecase})
      : _getLocalInfoUsecase = getLocalInfoUsecase,
        super(const AboutState());

  final GetLocalInfoUsecase _getLocalInfoUsecase;

  Future<void> getCurrentVersion() async {
    emit(state.copyWith(status: AboutStatus.loading));

    final result = await _getLocalInfoUsecase.call();

    result.fold(
      (failure) => emit(
        state.copyWith(status: AboutStatus.failed, version: "Opps"),
      ),
      (version) => emit(
        state.copyWith(status: AboutStatus.success, version: version.trim()),
      ),
    );
  }
}

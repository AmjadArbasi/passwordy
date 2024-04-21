import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_page_state.dart';

class NavigatorPageCubit extends Cubit<NavigatorPageState> {
  NavigatorPageCubit() : super(const NavigatorPageState());

  void setTab(NavigatorPageTab tab) => emit(NavigatorPageState(tab: tab));
}

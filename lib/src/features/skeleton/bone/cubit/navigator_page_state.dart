part of 'navigator_page_cubit.dart';

enum NavigatorPageTab { home, vault, profile }

final class NavigatorPageState extends Equatable {
  const NavigatorPageState({this.tab = NavigatorPageTab.home});

  final NavigatorPageTab tab;

  @override
  List<Object> get props => [tab];
}

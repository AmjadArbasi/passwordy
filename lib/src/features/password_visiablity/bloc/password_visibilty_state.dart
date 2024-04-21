part of 'password_visibilty_bloc.dart';

final class PasswordVisibiltyState extends Equatable {
  const PasswordVisibiltyState({required this.isVisible, this.id = ''});

  final bool isVisible;
  final String id;

  @override
  List<Object> get props => [isVisible];

  PasswordVisibiltyState copyWith({
    bool? isVisible,
    String? id,
  }) {
    return PasswordVisibiltyState(
      isVisible: isVisible ?? this.isVisible,
      id: id ?? this.id,
    );
  }
}

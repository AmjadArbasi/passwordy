part of 'edit_catchword_bloc.dart';

sealed class EditCatchwordEvent extends Equatable {
  const EditCatchwordEvent();

  @override
  List<Object> get props => [];
}

/// [EditCatchwordNameChanged] : update the value of name
/// [EditCatchwordAccountIdChanged] : update the value of account id
/// [EditCatchwordPasscodeChanged] : update the value of passcode
/// [EditCatchwordCategoryChanged] : update the value of category
/// [EditCatchwordSubmitted] : submit the values

final class EditCatchwordNameChanged extends EditCatchwordEvent {
  final String name;

  const EditCatchwordNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

final class EditCatchwordAccountIdChanged extends EditCatchwordEvent {
  final String accountId;

  const EditCatchwordAccountIdChanged({required this.accountId});
  @override
  List<Object> get props => [accountId];
}

final class EditCatchwordPasscodeChanged extends EditCatchwordEvent {
  final String passcode;

  const EditCatchwordPasscodeChanged({required this.passcode});

  @override
  List<Object> get props => [passcode];
}

final class EditCatchwordValueCopied extends EditCatchwordEvent {
  final String valueCopied;

  const EditCatchwordValueCopied({required this.valueCopied});
  @override
  List<Object> get props => [valueCopied];
}

final class EditCatchwordCategoryChanged extends EditCatchwordEvent {
  const EditCatchwordCategoryChanged({
    required this.category,
    this.currentIndex = 0,
  });

  final CategoryEntity category;
  final int currentIndex;
  @override
  List<Object> get props => [category, currentIndex];
}

final class EditCatchwordSubmitted extends EditCatchwordEvent {
  const EditCatchwordSubmitted();
}

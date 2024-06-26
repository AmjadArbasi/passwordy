part of 'edit_catchword_bloc.dart';

sealed class EditCatchwordEvent extends Equatable {
  const EditCatchwordEvent();

  @override
  List<Object> get props => [];
}

/// [EditCatchwordNameChanged] : update the value of name
/// [EditCatchwordAccountIdChanged] : update the value of account id
/// [EditCatchwordPasscodeChanged] : update the value of passcode
/// [EditCatchwordNoteChanged] : update the value of note
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

final class EditCatchwordNoteChanged extends EditCatchwordEvent {
  final String note;

  const EditCatchwordNoteChanged({required this.note});

  @override
  List<Object> get props => [note];
}

final class EditCatchwordValueCopied extends EditCatchwordEvent {
  final String valueCopied;

  const EditCatchwordValueCopied({required this.valueCopied});
  @override
  List<Object> get props => [valueCopied];
}

final class EditCatchwordCategoryChanged extends EditCatchwordEvent {
  const EditCatchwordCategoryChanged({required this.category});

  final CategoryEntity category;
  @override
  List<Object> get props => [category];
}

final class EditCatchwordSubmitted extends EditCatchwordEvent {
  const EditCatchwordSubmitted();
}

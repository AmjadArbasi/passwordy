part of 'edit_catchword_bloc.dart';

enum EditCatchwordStatus { initial, loading, success, failure }

final class EditCatchwordState extends Equatable {
  final String name;
  final String accountId;
  final String passcode;
  final String note;
  final String? valueCopied;
  final CatchwordEntity? initCatchword;
  final CategoryEntity category;
  final EditCatchwordStatus status;
  final int currentIndex;

  const EditCatchwordState({
    this.name = '',
    this.accountId = '',
    this.passcode = '',
    this.note = "",
    this.valueCopied,
    this.initCatchword,
    required this.category,
    this.status = EditCatchwordStatus.initial,
    this.currentIndex = 0,
  });

  @override
  List<Object?> get props => [
        name,
        accountId,
        passcode,
        note,
        initCatchword,
        category,
        status,
        valueCopied,
        currentIndex,
      ];

  EditCatchwordState copyWith({
    String? name,
    String? accountId,
    String? passcode,
    String? note,
    String? valueCopied,
    CatchwordEntity? initCatchword,
    CategoryEntity? category,
    EditCatchwordStatus? status,
    int? currentIndex,
  }) {
    return EditCatchwordState(
      name: name ?? this.name,
      accountId: accountId ?? this.accountId,
      passcode: passcode ?? this.passcode,
      note: note ?? this.note,
      valueCopied: valueCopied ?? this.valueCopied,
      initCatchword: initCatchword ?? this.initCatchword,
      category: category ?? this.category,
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

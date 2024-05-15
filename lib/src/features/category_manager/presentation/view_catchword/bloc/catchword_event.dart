part of 'catchword_bloc.dart';

/// [CatchwordsSubscriptionRequested]: This the start point. This event subscribes to the stream of Catchwords from the repository
/// [CatchwordsDeleteRequested]: deletes the `provided` catchword
/// [CatchwrodsUndoDeleteRequested]: undo deleted catchword
/// [CatchwordsCopyPressed]: copies the `provided` to clipboard
/// [CatchwordsUpdateCategoriesRequested]: update the categories from Ui
/// [CatchwordsResultSearchReturned]: returns a list of data
/// [CatchwordsPasswordVisibilityToggled] : toggles the visibility of the password
/// [CatchwordsRefreshRequested] : refresh the stream data
/// [CatchwordsUsingTrigger] : Trigger when catchword was used

sealed class CatchwordEvent extends Equatable {
  const CatchwordEvent();

  @override
  List<Object> get props => [];
}

final class CatchwordsSubscriptionRequested extends CatchwordEvent {
  const CatchwordsSubscriptionRequested();
}

final class CatchwordsDeleteRequested extends CatchwordEvent {
  final CatchwordEntity catchword;
  final CategoryEntity category;

  const CatchwordsDeleteRequested(
      {required this.catchword, required this.category});

  @override
  List<Object> get props => [catchword, category];
}

final class CatchwrodsUndoDeleteRequested extends CatchwordEvent {
  const CatchwrodsUndoDeleteRequested();
}

final class CatchwordsCopyPressed extends CatchwordEvent {
  const CatchwordsCopyPressed(
      {required this.copiedPasscode, required this.catchwordId});

  final String copiedPasscode;
  final int catchwordId;

  @override
  List<Object> get props => [copiedPasscode, catchwordId];
}

final class CatchwordsUpdateCategoriesRequested extends CatchwordEvent {
  const CatchwordsUpdateCategoriesRequested(
      {required this.filteredCategories, required this.currentIndex});

  final List<CategoryEntity> filteredCategories;
  final int currentIndex;

  @override
  List<Object> get props => [filteredCategories, currentIndex];
}

final class CatchwordsResultSearchReturned extends CatchwordEvent {
  const CatchwordsResultSearchReturned({required this.value});

  final String value;

  @override
  List<Object> get props => [value];
}

final class CatchwordsPasswordVisibilityToggled extends CatchwordEvent {
  const CatchwordsPasswordVisibilityToggled({
    // required this.isVisible,
    required this.catchwordEntity,
    required this.categoryEntity,
  });

  // final bool isVisible;
  final CatchwordEntity catchwordEntity;
  final CategoryEntity categoryEntity;

  @override
  List<Object> get props => [catchwordEntity, categoryEntity];
}

final class CatchwordsRefreshRequested extends CatchwordEvent {
  const CatchwordsRefreshRequested();
}

final class CatchwordsUsingTrigger extends CatchwordEvent {
  const CatchwordsUsingTrigger({required this.id});

  final int id;
}

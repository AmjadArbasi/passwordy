import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class UserManagementRepositoryMock extends Mock
    implements UserManagementRepository {}

final class CategoryManagerRepositryMock extends Mock
    implements CategoryManagerRepositryBase {}

class MockUserLocalEntity extends Mock implements UserLocalEntity {}

void main() {
  late UserManagementUsecase userManagementUsecase;
  late CategoryManagerUsecase categoryManagerUsecase;
  late UserManagementRepositoryMock userManagementRepositoryMock;
  late CategoryManagerRepositryMock categoryManagerRepositryMock;

  setUp(() {
    userManagementRepositoryMock = UserManagementRepositoryMock();
    categoryManagerRepositryMock = CategoryManagerRepositryMock();

    userManagementUsecase = UserManagementUsecase(
        userManagementRepository: userManagementRepositoryMock);
    categoryManagerUsecase =
        CategoryManagerUsecase(api: categoryManagerRepositryMock);
    categoryManagerUsecase.refreshData();
    when(
      () => userManagementUsecase.stream,
    ).thenAnswer((_) => const Stream<UserLocalEntity>.empty());
  });

  group('AuthBloc', () {
    group('check initializer', () {
      test('initial state is as same as AuthState()', () {});
    });
  });
}

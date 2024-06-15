import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/about_exception.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockInfoAboutRepository extends Mock
    implements InfoAboutRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GetLocalInfoUsecase getLocalInfoUsecase;
  late MockInfoAboutRepository mockInfoAboutRepository;
  late AboutCubit aboutCubit;

  setUp(() {
    mockInfoAboutRepository = MockInfoAboutRepository();

    getLocalInfoUsecase =
        GetLocalInfoUsecase(infoAboutRepository: mockInfoAboutRepository);

    aboutCubit = AboutCubit(getLocalInfoUsecase: getLocalInfoUsecase);
  });

  tearDown(() {
    aboutCubit.close();
  });

  group('AboutCubit', () {
    test('initial state', () {
      expect(aboutCubit.state, const AboutState());
    });

    group('status of fetching the app version', () {
      blocTest<AboutCubit, AboutState>(
        'emits [Success state, current version] when GetCurrentVersion is called.',
        build: () {
          when(() => mockInfoAboutRepository.getLocalVersion())
              .thenAnswer((_) async => const Right("1.0.0"));
          return aboutCubit;
        },
        act: (cubit) => cubit.getCurrentVersion(),
        expect: () => const [
          AboutState(status: AboutStatus.loading),
          AboutState(status: AboutStatus.success, version: "1.0.0")
        ],
      );

      blocTest<AboutCubit, AboutState>(
        'emits [failed state] when GetCurrentVersion is called.',
        build: () {
          when(() => mockInfoAboutRepository.getLocalVersion())
              .thenAnswer((_) async => Left(AboutException('Error')));
          return aboutCubit;
        },
        act: (cubit) => cubit.getCurrentVersion(),
        expect: () => const [
          AboutState(status: AboutStatus.loading),
          AboutState(status: AboutStatus.failed, version: "Opps")
        ],
      );
    });
  });
}

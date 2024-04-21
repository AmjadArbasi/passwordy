import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => InternalLocalService().init());

  final isar = await Database.create();

  final categoryModelToDbDtoConverter = CategoryModelToDbDtoConverter();
  final catchwordModelToDbDtoConverter = CatchwordModelToDbDtoConverter();
  final catchwordDbDtoToModelConverter = CatchwordDbDtoToModelConverter();
  final categoryDbDtoToModelConverter =
      CategoryDbDtoToModelConverter(catchwordDbDtoToModelConverter);

  final appLocalDatabase = AppLocalDatabase(
    categoryModelToDbDtoConverter: categoryModelToDbDtoConverter,
    categoryDbDtoToModelConverter: categoryDbDtoToModelConverter,
    catchwordModelToDbDtoConverter: catchwordModelToDbDtoConverter,
    catchwordDbDtoToModelConverter: catchwordDbDtoToModelConverter,
    isar: isar,
  );
  final api = CategoryManagerRepsoitoryImpl(
    appLocalDatabase: appLocalDatabase,
  );
  final categoryManagerUsecase = CategoryManagerUsecase(api: api);
  final passGenRepsotiory = PassGenRepsotiory();
  final generatePassword =
      GeneratePassword(passGenRepsotiory: passGenRepsotiory);

  runApp(MainApp(
    generatePassword: generatePassword,
    categoryManagerUsecase: categoryManagerUsecase,
  ));
}

class MainApp extends StatelessWidget {
  final CategoryManagerUsecase categoryManagerUsecase;
  final GeneratePassword generatePassword;

  const MainApp({
    super.key,
    required this.categoryManagerUsecase,
    required this.generatePassword,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryManagerUsecase),
        RepositoryProvider.value(value: generatePassword),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provides catchword bloc
        BlocProvider(
          create: (context) => CatchwordBloc(
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
          )..add(
              const CatchwordsSubscriptionRequested(),
            ),
        ),
        // Provides Manage category bloc
        BlocProvider(
          create: (context) => ManageCategoryBloc(
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
          )..add(const ManageCategorySubscribed()),
        ),
        // Provides Password visibilty bloc
        BlocProvider(
          create: (context) => PasswordVisibiltyBloc(false),
        ),
        // Provides Navigator Bloc
        BlocProvider(
          create: (context) => NavigatorPageCubit(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TranslatorController());

    return GetMaterialApp(
      getPages: Routes.getPages,
      theme: TAppTheme.lightTheme,
      locale: controller.language,
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslation(),
      initialRoute: AppRoutes.skeleton,
      defaultTransition: Transition.fade,
    );
  }
}

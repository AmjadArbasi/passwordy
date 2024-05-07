import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:flutter_application_passmanager/src/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => InternalLocalService().init());

  final isar = await Database.create();

  const storage = FlutterSecureStorage();
  final secureStorage = SecureStorage(storage: storage);

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
    secureStorage: secureStorage,
  );
  final api = CategoryManagerRepsoitoryImpl(appLocalDatabase: appLocalDatabase);
  final categoryManagerUsecase = CategoryManagerUsecase(api: api);
  final passGenRepsotiory = PassGenRepsotiory();
  final generatePassword =
      GeneratePassword(passGenRepsotiory: passGenRepsotiory);

  final sharedPreferences = await SharedPreferences.getInstance();

  final userManagementApi = UserManagementApi(
    isar: isar,
    secureStorage: secureStorage,
    sharedPreferences: sharedPreferences,
  );
  final userManagementRepository =
      UserManagementRepositoryImpl(api: userManagementApi);

  final userManagementUsecase =
      UserManagementUsecase(userManagementRepository: userManagementRepository);

  final ILogActivitiesApis apis =
      LogActivitiesApis(isar: isar, secureStorage: secureStorage);

  final LogActivityRepository activityRepository =
      LogActivityRepositoryImpl(apis: apis);

  final LogActivityUsecase logActivityUsecase =
      LogActivityUsecase(activityRepository: activityRepository);

  runApp(MainApp(
    generatePassword: generatePassword,
    categoryManagerUsecase: categoryManagerUsecase,
    userManagementUsecase: userManagementUsecase,
    logActivityUsecase: logActivityUsecase,
  ));
}

class MainApp extends StatelessWidget {
  final CategoryManagerUsecase categoryManagerUsecase;
  final GeneratePassword generatePassword;
  final UserManagementUsecase userManagementUsecase;
  final LogActivityUsecase logActivityUsecase;

  const MainApp({
    super.key,
    required this.categoryManagerUsecase,
    required this.generatePassword,
    required this.userManagementUsecase,
    required this.logActivityUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryManagerUsecase),
        RepositoryProvider.value(value: generatePassword),
        RepositoryProvider.value(value: userManagementUsecase),
        RepositoryProvider.value(value: logActivityUsecase),
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

        /// Provides [SignInCubit]
        BlocProvider(
          create: (context) => SignInCubit(
            userManagementUsecase: context.read<UserManagementUsecase>(),
          ),
        ),

        /// Provides [SignUpCubit]
        BlocProvider(
          create: (context) => SignUpCubit(
            userManagementUsecase: context.read<UserManagementUsecase>(),
          ),
        ),

        /// Provides [Auth]
        BlocProvider(
          create: (context) => AuthBloc(
            userManagementUsecase: context.read<UserManagementUsecase>(),
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
          )..add(
              const AuthCheckingStatusRequested(),
            ),
        ),

        /// Provides [UserUpdateInfoCubit]
        BlocProvider(
          create: (context) => UserUpdateInfoCubit(
            userManagementUsecase: context.read<UserManagementUsecase>(),
          ),
        ),

        /// Provides [Reset Password Qusetion]
        BlocProvider(
          create: (context) => ResetMasterPasscodeCubit(
            userManagementUsecase: context.read<UserManagementUsecase>(),
          ),
        ),

        /// Provides [Provides Info]
        BlocProvider(create: (context) => AboutCubit()),

        /// Provides [Log Activities]
        BlocProvider(
          create: (context) =>
              LogActitvitiesCubit(usecase: context.read<LogActivityUsecase>()),
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

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        logger.f(state.status);
        switch (state.status) {
          case AuthStatus.authenticated:
            Get.offAllNamed(AppRoutes.skeleton);
          case AuthStatus.unauthenticated:
            Get.offAllNamed(AppRoutes.signIn);
          case AuthStatus.onboarding:
            Get.offAllNamed(AppRoutes.onBoarding);
          default:
            Get.toNamed(AppRoutes.splash);
        }
      },
      child: GetMaterialApp(
        getPages: Routes.getPages,
        theme: TAppTheme.lightTheme,
        locale: controller.language,
        fallbackLocale: const Locale('en', 'US'),
        translations: AppTranslation(),
        home: const WelcomePage(),
        defaultTransition: Transition.fade,
      ),
    );
  }
}

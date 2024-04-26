import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:logger/logger.dart';

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

  const storage = FlutterSecureStorage();
  final secureStorage = SecureStorage(storage: storage);

  final userManagementApi = UserManagementApi(
    isar: isar,
    secureStorage: secureStorage,
  );
  final userManagementRepository =
      UserManagementRepositoryImpl(api: userManagementApi);

  final userManagementUsecase =
      UserManagementUsecase(userManagementRepository: userManagementRepository);

  runApp(MainApp(
    generatePassword: generatePassword,
    categoryManagerUsecase: categoryManagerUsecase,
    userManagementUsecase: userManagementUsecase,
  ));
}

class MainApp extends StatelessWidget {
  final CategoryManagerUsecase categoryManagerUsecase;
  final GeneratePassword generatePassword;
  final UserManagementUsecase userManagementUsecase;

  const MainApp({
    super.key,
    required this.categoryManagerUsecase,
    required this.generatePassword,
    required this.userManagementUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryManagerUsecase),
        RepositoryProvider.value(value: generatePassword),
        RepositoryProvider.value(value: userManagementUsecase),
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
          )..add(
              const AuthCheckingStatusRequested(),
            ),
        ),

        /// Provides [UserUpdateInfoCubit]
        BlocProvider(
          create: (context) => UserUpdateInfoCubit(
            userManagementUsecase: context.read<UserManagementUsecase>(),
          ),
        )
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
        Logger().f(state.status);
        switch (state.status) {
          case AuthStatus.authenticated:
            Get.offAllNamed(AppRoutes.skeleton);
          case AuthStatus.unauthenticated:
            Get.offAllNamed(AppRoutes.signIn);
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
        initialRoute: AppRoutes.welcome,
        defaultTransition: Transition.fade,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => InternalLocalService().init());

  final isar = await Database.create();

  const storage = FlutterSecureStorage();
  final secureStorage = SecureStorage(storage: storage);

  final catchwordConverterDbDTOModel = CatchwordConverterDbDTOModel();
  final categoryConverterDbDTOModel =
      CategoryConverterDbDTOModel(converter: catchwordConverterDbDTOModel);

  final categoryManagerApi = CategoryManagerApi(
    catchwordConverterDbDTOModel: catchwordConverterDbDTOModel,
    categoryConverterDbDTOModel: categoryConverterDbDTOModel,
    isar: isar,
    secureStorage: secureStorage,
  );
  final api =
      CategoryManagerRepsoitoryImpl(categoryManagerApi: categoryManagerApi);
  final categoryManagerUsecase = CategoryManagerUsecase(api: api);
  final passGenRepsotiory = PassGenRepsotiory();
  final generatePassword =
      GeneratePassword(passGenRepsotiory: passGenRepsotiory);

  final sharedPreferences = await SharedPreferences.getInstance();

  final ILogActivitiesApis apis =
      LogActivitiesApis(isar: isar, secureStorage: secureStorage);

  final LogActivityRepository activityRepository =
      LogActivityRepositoryImpl(apis: apis);

  final LogActivityUsecase logActivityUsecase =
      LogActivityUsecase(activityRepository: activityRepository);

  final InfoAboutRepository infoAboutRepository = InfoAboutRepositoryImpl();

  final GetLocalInfoUsecase getLocalInfoUsecase =
      GetLocalInfoUsecase(infoAboutRepository: infoAboutRepository);

  /// [Auth Apis and Repository]
  final IAuthApis iAuthApis = AuthApis(
    isar: isar,
    secureStorage: secureStorage,
    sharedPreferences: sharedPreferences,
  );
  final IAuthRepository iAuthRepository =
      AuthRepositoryImpl(iAuthApis: iAuthApis);

  /// [Auth usecases]
  final LogInUsecase logInUsecase =
      LogInUsecase(iAuthRepository: iAuthRepository);
  final LogOutUsecase logOutUsecase =
      LogOutUsecase(iAuthRepository: iAuthRepository);
  final GetStreamUsecase streamUsecase =
      GetStreamUsecase(iAuthRepository: iAuthRepository);
  final DisposeUsecase disposeUsecase =
      DisposeUsecase(iAuthRepository: iAuthRepository);
  final CheckSessionUsecase checkSessionUsecase =
      CheckSessionUsecase(iAuthRepository: iAuthRepository);
  final CheckOnboardingUsecase checkOnboardingUsecase =
      CheckOnboardingUsecase(iAuthRepository: iAuthRepository);

  /// [User manager Apis and Repsoitory]
  final IUserManagerApis iUserManagerApis = UserManagerApis(
    isar: isar,
    secureStorage: secureStorage,
    sharedPreferences: sharedPreferences,
  );
  final IUserManagerRepository iUserManagerRepository =
      UserManagerRepositoryImpl(iUserManagerApis: iUserManagerApis);

  /// [User manager usecases]
  final CreateUserUsecase createUserUsecase =
      CreateUserUsecase(iUserManagerRepository: iUserManagerRepository);
  final DeleteUserUsecase deleteUserUsecase =
      DeleteUserUsecase(iUserManagerRepository: iUserManagerRepository);
  final UpdateUserinfoUsecase updateUserinfoUsecase =
      UpdateUserinfoUsecase(iUserManagerRepository: iUserManagerRepository);
  final ResetMasterPasswordUsecase resetMasterPasswordUsecase =
      ResetMasterPasswordUsecase(
          iUserManagerRepository: iUserManagerRepository);

  /// Run the app
  runApp(MainApp(
    generatePassword: generatePassword,
    categoryManagerUsecase: categoryManagerUsecase,
    logActivityUsecase: logActivityUsecase,
    getLocalInfoUsecase: getLocalInfoUsecase,

    /// [Auth usecases]
    logInUsecase: logInUsecase,
    logOutUsecase: logOutUsecase,
    streamUsecase: streamUsecase,
    disposeUsecase: disposeUsecase,
    checkSessionUsecase: checkSessionUsecase,
    checkOnboardingUsecase: checkOnboardingUsecase,

    /// [User manager usecases]
    createUserUsecase: createUserUsecase,
    deleteUserUsecase: deleteUserUsecase,
    updateUserinfoUsecase: updateUserinfoUsecase,
    resetMasterPasswordUsecase: resetMasterPasswordUsecase,
  ));
}

class MainApp extends StatelessWidget {
  final CategoryManagerUsecase categoryManagerUsecase;
  final GeneratePassword generatePassword;
  final LogActivityUsecase logActivityUsecase;
  final GetLocalInfoUsecase getLocalInfoUsecase;

  /// [Auth usecases]
  final LogInUsecase logInUsecase;
  final LogOutUsecase logOutUsecase;
  final GetStreamUsecase streamUsecase;
  final DisposeUsecase disposeUsecase;
  final CheckSessionUsecase checkSessionUsecase;
  final CheckOnboardingUsecase checkOnboardingUsecase;

  /// [User manager usecases]
  final CreateUserUsecase createUserUsecase;
  final DeleteUserUsecase deleteUserUsecase;
  final UpdateUserinfoUsecase updateUserinfoUsecase;
  final ResetMasterPasswordUsecase resetMasterPasswordUsecase;

  const MainApp({
    super.key,
    required this.categoryManagerUsecase,
    required this.generatePassword,
    required this.logActivityUsecase,
    required this.getLocalInfoUsecase,

    /// [Auth usecases]
    required this.logInUsecase,
    required this.logOutUsecase,
    required this.streamUsecase,
    required this.disposeUsecase,
    required this.checkSessionUsecase,
    required this.checkOnboardingUsecase,

    /// [User manager usecases]
    required this.createUserUsecase,
    required this.deleteUserUsecase,
    required this.updateUserinfoUsecase,
    required this.resetMasterPasswordUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: categoryManagerUsecase),
        RepositoryProvider.value(value: generatePassword),
        RepositoryProvider.value(value: logActivityUsecase),
        RepositoryProvider.value(value: getLocalInfoUsecase),

        /// [Auth usecases]
        RepositoryProvider.value(value: logInUsecase),
        RepositoryProvider.value(value: logOutUsecase),
        RepositoryProvider.value(value: streamUsecase),
        RepositoryProvider.value(value: disposeUsecase),
        RepositoryProvider.value(value: checkSessionUsecase),
        RepositoryProvider.value(value: checkOnboardingUsecase),

        /// [User manager usecases]
        RepositoryProvider.value(value: createUserUsecase),
        RepositoryProvider.value(value: deleteUserUsecase),
        RepositoryProvider.value(value: updateUserinfoUsecase),
        RepositoryProvider.value(value: resetMasterPasswordUsecase),
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
        /// Provides [catchword bloc]
        BlocProvider(
            create: (context) => CatchwordBloc(
                  categoryManagerUsecase:
                      context.read<CategoryManagerUsecase>(),
                )),

        /// Provides [Manage category bloc]
        BlocProvider(
            create: (context) => ManageCategoryBloc(
                  categoryManagerUsecase:
                      context.read<CategoryManagerUsecase>(),
                )),

        /// Provides [Password visibilty bloc]
        BlocProvider(
          create: (context) => PasswordVisibiltyBloc(false),
        ),

        /// Provides [Navigator Bloc]
        BlocProvider(
          create: (context) => NavigatorPageCubit(),
        ),

        /// Provides [SignInCubit]
        BlocProvider(
          create: (context) =>
              SignInCubit(logInUsecase: context.read<LogInUsecase>()),
        ),

        /// Provides [CreateUserCubit]
        BlocProvider(
          create: (context) => CreateUserCubit(
            createUserUsecase: context.read<CreateUserUsecase>(),
          ),
        ),

        /// Provides [Auth]
        BlocProvider(
          create: (context) => AuthBloc(
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
            logOutUsecase: context.read<LogOutUsecase>(),
            streamUsecase: context.read<GetStreamUsecase>(),
            disposeUsecase: context.read<DisposeUsecase>(),
            checkSessionUsecase: context.read<CheckSessionUsecase>(),
            checkOnboardingUsecase: context.read<CheckOnboardingUsecase>(),
          )..add(
              const AuthCheckingStatusRequested(),
            ),
        ),

        /// Provides [UserUpdateInfoCubit]
        BlocProvider(
          create: (context) => UserUpdateInfoCubit(
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
            updateUserinfoUsecase: context.read<UpdateUserinfoUsecase>(),
            streamUsecase: context.read<GetStreamUsecase>(),
          ),
        ),

        /// Provides [UserDeletionRequest]
        BlocProvider(
          create: (context) => UserRequestDeletionCubit(
            deleteUserUsecase: context.read<DeleteUserUsecase>(),
          ),
        ),

        /// Provides [Reset Master Password]
        BlocProvider(
          create: (context) => ResetMasterPasscodeCubit(
            categoryManagerUsecase: context.read<CategoryManagerUsecase>(),
            resetMasterPasswordUsecase:
                context.read<ResetMasterPasswordUsecase>(),
          ),
        ),

        /// Provides [Provides Info]
        BlocProvider(
            create: (context) => AboutCubit(
                  getLocalInfoUsecase: context.read<GetLocalInfoUsecase>(),
                )),

        /// Provides [Log Activities]
        BlocProvider(
          create: (context) =>
              LogActivitiesBloc(usecase: context.read<LogActivityUsecase>())
                ..add(const LogActivitiesSubscibeRequested()),
        ),

        /// Provides [ShowUserinfo]
        BlocProvider(
          create: (context) => ShowUserInfoCubit(
            streamUsecase: context.read<GetStreamUsecase>(),
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void dispose() {
    context.read<AuthBloc>().close();
    context.read<LogActivitiesBloc>().close();
    GlobalVar.logger.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TranslatorController());

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
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
        debugShowCheckedModeBanner: false,
        getPages: Routes.getPages,
        theme: controller.themeApp,
        locale: controller.language,
        fallbackLocale: const Locale('en', 'US'),
        translations: AppTranslation(),
        home: const WelcomePage(),
        defaultTransition: Transition.fade,
      ),
    );
  }
}

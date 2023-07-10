import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myflutterprofile/components/app_title_builder.dart';
import 'package:myflutterprofile/presentations/home/home_screen.dart';
import 'package:myflutterprofile/presentations/home/cubits/home_cubit.dart';
import 'package:myflutterprofile/presentations/splash/splash_screen.dart';
import 'package:myflutterprofile/resources/constants/colors.dart';
import 'package:url_strategy/url_strategy.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerLazySingleton<HomeCubit>(() => HomeCubit());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Here we set the URL strategy for our web app.
  // This will remove /#/
  setPathUrlStrategy();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalColors.primaryColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalColors.primaryColor,
              width: 1.5,
            ),
          ),
          errorStyle: TextStyle(color: Colors.red),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalColors.primaryColor,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: AppTitleBuilder(
          child: child,
        ),
      ),
      routes: <GoRoute>[
        /////////////////////////////////
        /// Products
        /////////////////////////////////
        // path: /
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(
            child: kIsWeb
              ? MyHomePage(title: 'My Profile')
              : SplashScreen(title: 'My Profile'),
          ),
        ),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const MaterialPage(
            child: MyHomePage(title: 'My Profile'),
          ),
        ),
        // path: /collections
      ],
    ),
  ]);
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

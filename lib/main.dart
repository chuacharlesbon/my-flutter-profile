import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Here we set the URL strategy for our web app.
  // This will remove /#/
  setPathUrlStrategy();

  // Load .env
  await dotenv.load(fileName: ".env");
  
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
        GoRoute(
          path: '/',
          name: 'profile',
          pageBuilder: (context, state) => const MaterialPage(
            child: kIsWeb
              ? MyHomePage(title: 'My Profile')
              : SplashScreen(title: 'My Profile'),
          ),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const MaterialPage(
            child: MyHomePage(title: 'My Profile'),
          ),
        ),
        GoRoute(
          path: '/rules',
          name: 'rules',
          pageBuilder: (context, state) => const MaterialPage(
            child: MyHomePage(title: 'My Profile'),
          ),
        ),
        GoRoute(
          path: '/book-now',
          name: 'book-now',
          pageBuilder: (context, state) => const MaterialPage(
            child: MyHomePage(title: 'My Profile'),
          ),
        ),
        GoRoute(
          path: '/emergency',
          name: 'emergency',
          pageBuilder: (context, state) => const MaterialPage(
            child: MyHomePage(title: 'My Profile'),
          ),
        ),
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

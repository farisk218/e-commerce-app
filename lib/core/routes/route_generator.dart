import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/bloc/auth_cubit.dart';
import '../../features/auth/screens/auth_screen.dart';
import '../../features/home/bloc/home_cubit.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/main/screens/main_screen.dart';
import '../../features/main/screens/splash_screen.dart';
import '../constants/strings.dart';

class RouteGenerator {
  static RouteGenerator? _instance;

  static RouteGenerator get instance {
    _instance ??= RouteGenerator();
    return _instance!;
  }

  static const String routeInitial = "/";
  static const String routeAuth = "/auth";
  static const String routeHome = "/home";
  static const String routeMain = "/main";
  static const String routeError = "/error";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeInitial:
        return _buildRoute(routeInitial, const SplashScreen());
      case routeAuth:
        return _buildRoute(
          routeAuth,
          BlocProvider<AuthenticationCubit>(
              create: (context) => GetIt.instance<AuthenticationCubit>(),
              child: AuthScreen()),
        );
      case routeHome:
        return _buildRoute(
          routeHome,
          BlocProvider<HomeCubit>(
              create: (context) => GetIt.instance<HomeCubit>(),
              child: const HomeScreen()),
        );
      case routeMain:
        return _buildRoute(routeMain, const MainScreen());
      default:
        return _buildRoute(routeError, const ErrorView());
    }
  }

  MaterialPageRoute _buildRoute(String route, Widget widget,
      {bool enableFullScreen = false}) {
    return MaterialPageRoute(
      fullscreenDialog: enableFullScreen,
      settings: RouteSettings(name: route),
      builder: (_) => widget,
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppStrings.pageNotFound),
      ),
    );
  }
}
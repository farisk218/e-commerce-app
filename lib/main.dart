import 'package:e_commerce_app/features/auth/bloc/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/strings.dart';
import 'core/theme/app_colors.dart';
import 'injection_container.dart' as di;
import 'features/main/screens/splash_screen.dart';
import 'core/routes/route_generator.dart'; // Import RouteGenerator
import 'features/home/bloc/home_cubit.dart'; // Import HomeCubit

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationCubit>(
      create: (_) => AuthenticationCubit(FirebaseAuth.instance),
    ),
    BlocProvider<HomeCubit>( // Add HomeCubit provider
      create: (_) => di.sl<HomeCubit>(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1),
                ),
                child: MaterialApp(
                  title: AppStrings.appName,
                  theme: ThemeData(
                    primaryColor: AppColors.primary, // Use primaryColor instead
                    primarySwatch: Colors.blue, // Example MaterialColor
                  ),
                  home: const SplashScreen(),
                  onGenerateRoute: RouteGenerator.instance.generateRoute, // Use RouteGenerator
                ),
              );
            },
          );
        });
  }
}
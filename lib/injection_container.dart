import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'core/utils/api_client.dart';
import 'features/auth/bloc/auth_cubit.dart';
import 'features/home/bloc/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Features - Authentication
  sl.registerFactory(() => AuthenticationCubit(sl<FirebaseAuth>()));

  // Features - Home
  sl.registerFactory(() => HomeCubit(sl<ApiClient>()));

}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _firebaseAuth;

  AuthenticationCubit(this._firebaseAuth) : super(const AuthenticationState());

  void logIn(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
     final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print('logged in');
      print(userCredential.user!.email);
      emit(state.copyWith(isLoggedIn: true, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(
          state.copyWith(error: e.message ?? 'Login Failed', isLoading: false));
    }
  }

  void logOut() async {
    await _firebaseAuth.signOut();
    print('logged out');
    emit(state.copyWith(isLoggedIn: false));
  }
}
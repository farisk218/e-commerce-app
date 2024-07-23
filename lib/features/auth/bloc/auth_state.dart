import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  final bool isLoading;
  final bool isLoggedIn;
  final String error;

  const AuthenticationState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.error = '',
  });

  AuthenticationState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? error,
  }) {
    return AuthenticationState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [isLoading, isLoggedIn, error];
}

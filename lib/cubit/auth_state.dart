part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  const AuthSuccess(this.user);
  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String eror;
  const AuthFailed(this.eror);
  @override
  List<Object> get props => [eror];
}

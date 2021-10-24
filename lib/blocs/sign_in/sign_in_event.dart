part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

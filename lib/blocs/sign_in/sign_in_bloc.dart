import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/api_client.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  ApiClient _apiClient = ApiClient();

  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignIn) {
      yield SignInLoading();
      try {
        final Response response =
            await _apiClient.signIn(event.email, event.password);
        UserModel userModel = UserModel.fromJson(response.data);
        yield SignInSuccess(userModel);
      } catch (error) {
        yield SignInError();
      }
    }
  }
}

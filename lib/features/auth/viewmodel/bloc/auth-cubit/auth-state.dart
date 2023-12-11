
import 'package:babi_dealz_app/model/register_model/register_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../model/login_model/login_model.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class ChangeState extends AuthState{}
class RememberMe extends AuthState{}

// SignIn state start
class SignInLoadingState extends AuthState{}
class SignInSuccessfulState extends AuthState
{
  LoginModel loginModel;
  SignInSuccessfulState({required this.loginModel});
}
class SignInErrorState extends AuthState
{
  String error;
  SignInErrorState({required this.error});
}

// SignUp state start
class SignUpLoadingState extends AuthState{}
class SignUpSuccessfulState extends AuthState
{
  RegisterModel registerModel;
  SignUpSuccessfulState({required this.registerModel});
}
class SignUpErrorState extends AuthState{
  String error;
  SignUpErrorState({required this.error});
}

class ImageLoadingState extends AuthState{}
class ImageSuccessfulState extends AuthState
{

}
class ImageErrorState extends AuthState{
  String error;
  ImageErrorState({required this.error});
}
// send otp to verify Email States
class SendOtpVerifyPhoneLoadingState extends AuthState{}
class SendOtpVerifyPhoneSuccessfulState extends AuthState
{
  String message;
  SendOtpVerifyPhoneSuccessfulState({required this.message});
}
class SendOtpVerifyPhoneErrorState extends AuthState{
  String error;
  SendOtpVerifyPhoneErrorState({required this.error});
}
// send otp to verify Email States
class VerifyPhoneLoadingState extends AuthState{}
class VerifyPhoneSuccessfulState extends AuthState
{
  String message;
  VerifyPhoneSuccessfulState({required this.message});
}
class VerifyPhoneErrorState extends AuthState{
  String error;
  VerifyPhoneErrorState({required this.error});
}
// send otp to verify Email States

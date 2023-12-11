import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart'  as di;
import 'package:image_picker/image_picker.dart';
import '../../../../../constant/constant.dart';
import '../../../../../core/helpers/database/local/cach_helper.dart';
import '../../../../../model/login_model/login_model.dart';
import '../../../../../model/register_model/register_model.dart';
import '../../../../../model/user_model/user_model.dart';
import '../../repo/login_repo/login_repo.dart';
import '../../repo/register_repo/register_repo.dart';
import '../../repo/verify_email_repo/verify_repo.dart';
import 'auth-state.dart';
import 'dart:io'  as io;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginRepo,  this.registerRepo,this.verifyPhoneRepo): super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  final LoginRepo loginRepo;




  ///////////////////////////////////////////////signin//////////////////////////////////////////
  LoginModel? loginModel;
  Future<void> signIn({required String phone, required String password}) async {
    emit(SignInLoadingState());
    var result = await loginRepo!.login(phone, password);
    result.fold((failure) {
      emit(SignInErrorState(error: failure.errorMessage));
    }, (responseLoginData) async {
      loginModel = responseLoginData;
      await CacheHelper.put(key: name, value: loginModel!.modelData!.loginData!.name ?? '');
      await CacheHelper.put(key: phone, value: loginModel!.modelData!.loginData!.phone ??'');
      await CacheHelper.put(key: token, value: loginModel!.modelData!.token);
      emit(SignInSuccessfulState(loginModel: responseLoginData));
    });
  }



  /////////////////////////////////////////////selectImage//////////////////////////////////////////

  io.File ? fileImage;
  final ImagePicker picker = ImagePicker();
  Future selectImage()
  async{
    emit(ImageLoadingState());
    XFile? image= await picker.pickImage(source: ImageSource.gallery);
    if(image!=null)
      {
        fileImage = io.File(image.path);
        print(fileImage);
        emit(ImageSuccessfulState());
      }
   // emit(ImageErrorState(error:fl ))
  }

////////////////////////////////////////////////// signup///////////////////////////////////////////////


 final RegisterRepo registerRepo;
  RegisterModel? registerModel;

  Future<void> signUp(User user , type) async {

    di.FormData formData = di.FormData.fromMap
      (
       user.toJson()
    );

    if(fileImage!=null)
    {
      formData.files.add(MapEntry("photo", await di.MultipartFile.fromFile(fileImage!.path,filename: "upload.txt")),);
    }
    emit(SignUpLoadingState());
    var result = await registerRepo!.register(user,type ?? '',formData
    );
    result.fold((failure) {
      emit(SignUpErrorState(error: failure.errorMessage));
    }, (responseRegisterData) async {
      registerModel = responseRegisterData;
      emit(SignUpSuccessfulState(registerModel: responseRegisterData));
    });
  }

  //////////////////////////////////////////otp///////////////////////////////////

  VerifyPhoneRepo verifyPhoneRepo;
  String? phonee;

  Future<void> sendOtpVerifyPhone(String otp) async {
    emit(SendOtpVerifyPhoneLoadingState());
    var result = await verifyPhoneRepo.verifyPhone(phonee!, otp);
    result.fold(
            (failure) => emit(SendOtpVerifyPhoneErrorState(error: failure.errorMessage)),
            (r) => emit(SendOtpVerifyPhoneSuccessfulState(message: r)));
  }

  Future<void> reSendOtpVerifyPhone(String phoone) async {
    emit(VerifyPhoneLoadingState());
    var result = await verifyPhoneRepo.reSendOtpToVerifyPhone(phoone);
    result.fold(
            (failure) => emit(VerifyPhoneErrorState(error: failure.errorMessage)),
            (r) => emit(VerifyPhoneSuccessfulState(message: r)));
  }


}

import 'package:babi_dealz_app/core/helpers/database/network/endpoints/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/errors/faluirs.dart';
import '../../../../../core/helpers/database/network/dio/dio_helper.dart';
import '../../../../../model/login_model/login_model.dart';


abstract class LoginRepo {
  Future<Either<Failures, LoginModel>> login(
      String phone, String password);
}

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failures, LoginModel>> login(
      String phone, String password) async {
    Map<String, dynamic> data =
    {
      "phone": phone,
      "password": password,
    };
    try {
      Response response =
      await DioHelper.postData(url:EndPoints.signInEndPoint , data: data);
      return Right(LoginModel.fromJson(response.data));
    } on DioError catch (e)
    {
      debugPrint("-------------Response Data----------------");
      debugPrint(e.response!.data.toString());
      debugPrint("-------------Response Data----------------");
      return Left(ServerFailure.fromDioError(e));
    }
  }
}

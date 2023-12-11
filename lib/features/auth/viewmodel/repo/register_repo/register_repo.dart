import 'package:babi_dealz_app/core/helpers/database/network/endpoints/endpoints.dart';
import 'package:babi_dealz_app/model/login_model/login_model.dart';
import 'package:babi_dealz_app/model/register_model/register_model.dart';
import 'package:dio/dio.dart' as di;
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../constant/constant.dart';
import '../../../../../core/errors/faluirs.dart';
import '../../../../../core/helpers/database/network/dio/dio_helper.dart';
import '../../../../../model/user_model/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failures, RegisterModel>> register(User user,String type,dynamic data);
}



////////////////////////////////////////////////////////////////////////




class RegisterRepoImpl extends RegisterRepo {

  Map<String, dynamic>  data ={

  };
  @override
  Future<Either<Failures, RegisterModel>> register(User user,String type,dynamic data) async {
    try {

      Response response =
      await DioHelper.postData(url:type=='customer'?EndPoints.SignUpCustomerEndPoint:
      type=='deals'?EndPoints.SignUpDealsEndPoint:type=='agency'?EndPoints.SignUpAgancyEndPoint:"",
          data:data,

      );
      print(response.statusCode);
      return Right(RegisterModel.fromJson(response.data));
    } on DioException catch (e) {
      debugPrint("-------------Response Data----------------");
      debugPrint(e.response!.data.toString());
      debugPrint("-------------Response Data----------------");
      return Left(ServerFailure.fromDioError(e));
    }
  }



  }



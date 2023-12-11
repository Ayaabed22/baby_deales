import 'package:babi_dealz_app/core/helpers/database/network/endpoints/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../../core/errors/faluirs.dart';
import '../../../../../core/helpers/database/network/dio/dio_helper.dart';

abstract class VerifyPhoneRepo
{
  Future<Either<Failures, String>>  verifyPhone(String phone , String otp);
  Future<Either<Failures, String>> reSendOtpToVerifyPhone(String phone);

}

class VerifyPhoneRepoImpl extends VerifyPhoneRepo {


  @override
  Future<Either<Failures, String>>
  verifyPhone(String phone, String otp) async
  {
    try {
      Response response = await DioHelper.postData(
          url:EndPoints.VerifyPhoneEndPoint, data:
      {
        "phone": phone,
        "verification_code": otp
      });
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
  @override
  Future<Either<Failures, String>> reSendOtpToVerifyPhone(String phone) async {
    try {
      Response response = await DioHelper.postData(
          url:EndPoints.ResendVerifyPhoneEndPoint, data: {"phone": phone});
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
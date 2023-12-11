
import '../core/helpers/database/local/cach_helper.dart';

const durationMilliseconds = Duration(milliseconds: 500);
const durationSeconds = Duration(seconds: 2);
const mainFontFamily = 'Urbanist';

const String name = "name";
const String phone='phone';
const String token = "token";
const String photo = "photo";

userName()
{
  return  CacheHelper.getDataString(key: name);
}
UserPhone()
{
  return  CacheHelper.getDataString(key: phone);
}
getToken()
{
  return  CacheHelper.getDataString(key: token);
}
UserPhoto()
{
  return  CacheHelper.getDataString(key: token);
}
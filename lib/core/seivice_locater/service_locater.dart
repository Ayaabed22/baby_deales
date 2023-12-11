import 'package:get_it/get_it.dart';

import '../../features/auth/viewmodel/repo/login_repo/login_repo.dart';
import '../../features/auth/viewmodel/repo/register_repo/register_repo.dart';
import '../../features/auth/viewmodel/repo/verify_email_repo/verify_repo.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  sl.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl());
  sl.registerLazySingleton<VerifyPhoneRepoImpl>(() => VerifyPhoneRepoImpl());
}
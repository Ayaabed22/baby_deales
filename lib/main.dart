import 'package:babi_dealz_app/features/auth/viewmodel/repo/register_repo/register_repo.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/app_routes/router/app_router.dart';
import 'core/helpers/database/local/cach_helper.dart';
import 'core/helpers/database/network/dio/dio_helper.dart';
import 'core/seivice_locater/service_locater.dart';
import 'core/utils/app_theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/viewmodel/bloc/auth-cubit/auth-cubit.dart';
import 'features/auth/viewmodel/repo/login_repo/login_repo.dart';
import 'features/auth/viewmodel/repo/verify_email_repo/verify_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setup();
  await DioHelper.init();
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => AuthCubit(sl.get<LoginRepoImpl>(),sl.get<RegisterRepoImpl>(),sl.get<VerifyPhoneRepoImpl>())
            ),
          ],
          child:MaterialApp.router(
            routerConfig: AppRouter.router,
            title: 'Babi Dealz',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              useMaterial3: true,
              scaffoldBackgroundColor: AppTheme.scaffoldBackGroundColor,
              textTheme: GoogleFonts.urbanistTextTheme(),
            ),
          ),
          );

        });
  }
}

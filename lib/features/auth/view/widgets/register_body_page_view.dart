import 'package:babi_dealz_app/features/auth/viewmodel/bloc/auth-cubit/auth-cubit.dart';
import 'package:babi_dealz_app/features/auth/viewmodel/bloc/auth-cubit/auth-state.dart';
import 'package:babi_dealz_app/model/login_model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_routes/router/app_router.dart';
import '../../../../core/app_routes/routes/app_routes.dart';
import '../../../../core/core_components/custom_button.dart';
import '../../../../core/core_components/custom_drop_down_button.dart';
import '../../../../core/core_components/custom_text.dart';
import '../../../../core/core_components/custom_text_form_field.dart';
import '../../../../core/enums/image_handeler.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/app_assets/app_assets.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../../core/utils/app_theme/app_theme.dart';
import '../../../../model/user_model/user_model.dart';

class RegisterBodyPageView extends StatefulWidget {
  RegisterBodyPageView({super.key});

  @override
  State<RegisterBodyPageView> createState() => _RegisterBodyPageViewState();
}

class _RegisterBodyPageViewState extends State<RegisterBodyPageView> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController agencyOwner = TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? selectedOption;
  String? registerType;
  bool? isAgency;

  List<String> options = [
    AppString.customerString,
    AppString.dealsString,
    AppString.agencyString
  ];


  // final controller = MapController.customLayer(
  // initPosition: GeoPoint(
  // latitude: 47.4358055,
  // longitude: 8.4737324,
  // ),
  // customTile: CustomTile(
  // sourceName: "opentopomap",
  // tileExtension: ".png",
  // minZoomLevel: 2,
  // maxZoomLevel: 19,
  // urlsServers: [
  // TileURLs(
  // url: "https://tile.opentopomap.org/",
  // subdomains: [],
  // )
  // ],
  // tileSize: 256,
  // ),
  // );



  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: screenWidth / 360,
                  child: Image.asset(AppAssets.loginAsset, fit: BoxFit.fill),
                ),
                Positioned(
                    top: 30.h,
                    right: 30.h,
                    left: 30.h,
                    child: Image.asset(
                      AppAssets.logoAsset,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: AppString.registerString,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.urbanistTextStyle24.copyWith(
                        color: AppTheme.darkColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextWidget(
                      text: AppString.loginDescription,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.swisLightText14.copyWith(
                        color: AppTheme.subTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Column(
              children: [
                Padding(
                  padding:EdgeInsetsDirectional.symmetric(horizontal: 35),
                  child: CustomDropdownButton(
                    changeBorderColor: true,
                    isSelectedType: true,
                    selectedOption: selectedOption,
                    options: options,
                    onChanged: (newValue) {
                      setState(
                        () {
                          selectedOption = newValue;
                          registerType = selectedOption;
                          print("selected OPtion is");
                          print(selectedOption);
                          if (selectedOption == "agency") {
                            setState(() {
                              isAgency = true;
                            });
                          }
                        },
                      );
                    },
                    text: AppString.selectTypeString,
                  ),
                ),
                SizedBox(height: 11.h,),
                CustomFormField(
                  hintText: AppString.phoneString,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomFormField(
                  hintText: AppString.nameString,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                isAgency ?? false
                    ? Column(
                        children: [
                          CustomFormField(
                            hintText: AppString.agencyOwner,
                            controller: agencyOwner,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 30),
                            child: Row(
                              children: [
                                CustomFormField(
                                  hintText: AppString.address,
                                  hasIcon: true,
                                  enable: true,
                                ),
                                SizedBox(
                                  width: 9.h,
                                ),
                                InkWell(
                                  onTap: () async{
                                    print("jhg");
                                    GoRouter.of(context).push(AppRoutes.mapsRoute);

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          AppAssets.address,
                                          width: 40,
                                          height: 40,
                                          color: Colors.grey.shade300,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 300,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 15,
                                  left: 85,
                                  child: InkWell(
                                   onTap: (){
                                     AuthCubit.get(context).selectImage();
                                     print(AuthCubit.get(context).fileImage);
                                   },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                      CircleAvatar(
                                        child: Icon(Icons.add,color:AppTheme.whiteColor,),
                                      radius: 15,
                                      backgroundColor: AppTheme.subTitleColor,),
                                      SizedBox(height: 6.h,),
                                      Text(AppString.uploadLogo,style: Styles.sitkaRegularText20.copyWith(
                                        color: AppTheme.subTitleColor,
                                        fontWeight: FontWeight.normal
                                      ),),
                                      ],
                                    ),
                                  ),

                              )
                            ],
                          )
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 12.h,
                ),
                CustomFormField(
                  hintText: AppString.passwordString,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomFormField(
                  hintText: AppString.confirmPasswordString,
                  controller: confirmPasswordController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                    listener: (BuildContext context, AuthState state) {
                  if (state is SignUpSuccessfulState) {
                    print("SignUp Sucess");
                    GoRouter.of(context)
                        .push(AppRoutes.otpViewRoute);
                  } else if (state is SignUpErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                      backgroundColor: AppTheme.darkColor,
                    ));
                  }
                }, builder: (BuildContext context, AuthState state) {
                  return (state is SignUpLoadingState)
                      ? Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : CustomButton(
                          text: AppString.registerString,
                          isHeight: false,
                          onPressed: () {
                            User userModel = User(
                              name: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              confirmPassword: passwordController.text,
                              photo: AuthCubit.get(context).fileImage,
                              agencyOwner: agencyOwner.text,

                            );
                            AuthCubit.get(context)
                                .signUp(userModel, registerType);
                          },
                          textSize: false,
                        );
                }),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth * .11),
              child: Row(children: [
                CustomTextWidget(
                  text: AppString.haveAccountString,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.swisLightText14.copyWith(
                    color: AppTheme.subTitleColor,
                  ),
                ),
                SizedBox(
                  width: 90.r,
                ),
                CustomTextWidget(
                  text: AppString.loginString,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.swisLightText14.copyWith(
                      color: AppTheme.darkColor,
                      decoration: TextDecoration.underline),
                ),
              ]),
            ),
            SizedBox(
              height: 29.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth * .09),
              child: Row(children: [
                Container(
                  color: AppTheme.darkColor,
                  width: 80.r,
                  height: 1.h,
                ),
                SizedBox(
                  width: 11.r,
                ),
                CustomTextWidget(
                  text: AppString.loginApps,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.swisLightText14.copyWith(
                    color: AppTheme.darkColor,
                  ),
                ),
                SizedBox(
                  width: 11.r,
                ),
                Container(
                  color: AppTheme.darkColor,
                  width: 80.r,
                  height: 1.h,
                ),
              ]),
            ),
            SizedBox(
              height: 31.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth * .30),
              child: Row(children: [
                Image.asset(
                  AppAssets.googleLogin,
                  height: 22.h,
                  width: 22.r,
                  color: AppTheme.yellowColor,
                ),
                SizedBox(
                  width: 33.r,
                ),
                Image.asset(
                  AppAssets.facebookLogin,
                  height: 22.h,
                  width: 22.r,
                ),
                SizedBox(
                  width: 33.r,
                ),
                Image.asset(
                  AppAssets.twitterLogin,
                  height: 22.h,
                  width: 22.r,
                  color: AppTheme.yellowColor,
                ),
              ]),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

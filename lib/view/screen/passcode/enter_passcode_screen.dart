import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/enter_passcode_controller.dart';
import '../../../controller/keyboard_controller.dart';
import '../../../controller/local_auth/local_auth_controller.dart';
import '../../../controller/sign_in_controller.dart';
import '../../../helper/shared_preference_helper.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/keyboard/custom_keyboard.dart';
import '../../widgets/text/custom_text.dart';

class EnterPasscodeScreen extends StatefulWidget {
  EnterPasscodeScreen({super.key});

  @override
  State<EnterPasscodeScreen> createState() => _EnterPasscodeScreenState();
}

class _EnterPasscodeScreenState extends State<EnterPasscodeScreen> {
  KeyboardController keyboardController = Get.put(KeyboardController());

  EnterPasscodeController enterPasscodeController =
      Get.put(EnterPasscodeController());

  LocalAuthController localAuthController = Get.put(LocalAuthController());
  final LocalAuthentication auth = LocalAuthentication();

  SignInController signInController = Get.put(SignInController());

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  @override
  void initState() {
    super.initState();

    getIsLogIn();
  }

  Future<void> getIsLogIn() async {
    try {
      if (SharedPreferenceHelper.isLocalAuth) {
        auth.isDeviceSupported().then((bool isSupported) => setState(() {
              localAuthController.supportState = isSupported
                  ? SupportState.supported
                  : SupportState.unsupported;

              localAuthController.authenticateWithBiometrics(
                  mounted, SharedPreferenceHelper.refreshToken);
            }));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Enter your passcode".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  bottom: 24.h,
                  top: 100.h,
                  maxLines: 2,
                ),
                Flexible(
                  flex: 0,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                    child: PinCodeTextField(
                      controller: enterPasscodeController.enterController,
                      cursorColor: AppColors.white100,
                      obscureText: true,
                      enablePinAutofill: true,
                      obscuringCharacter: "*",
                      appContext: (context),
                      onTap: () {
                        enterPasscodeController.disableKeyboard.value = false;
                      },
                      validator: (value) {
                        if (value!.length != 4) {
                          return null;
                        } else {
                          // return "Please enter passcode".tr;
                        }
                      },
                      autoFocus: true,
                      showCursor: false,
                      onChanged: (controllerLength) {
                        if (controllerLength.length == 4) {
                          enterPasscodeController.disableKeyboard.value = true;

                          enterPasscodeController.signInWithPasscodeRepo(
                              SharedPreferenceHelper.email);


                          // if (SharedPreferenceHelper.isLogIn) {
                          //   enterPasscodeController.signInWithPasscodeRepo(
                          //       SharedPreferenceHelper.email);
                          // } else {
                          //
                          //   if (signInController.signInModelInfo == null) {
                          //     Get.toNamed(AppRoute.logIn);
                          //   }
                          //   SignInModel signInModel =
                          //       signInController.signInModelInfo!;
                          //   enterPasscodeController.enterPasscodeRepo(
                          //       signInModel.data!.passcodeToken!);
                          // }
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 12.sp,
                        fieldWidth: 12.sp,
                        fieldOuterPadding: EdgeInsets.all(10.sp),
                        activeFillColor: Colors.black,
                        selectedFillColor: AppColors.transparentColor,
                        inactiveFillColor: AppColors.transparentColor,
                        borderWidth: 0.0.w,
                        errorBorderColor: AppColors.primaryColor,
                        selectedColor: AppColors.white100,
                        activeColor: AppColors.transparentColor,
                        inactiveColor: AppColors.white100,
                      ),
                      length: 4,
                      keyboardType: TextInputType.none,
                      enableActiveFill: true,
                    ),
                  ),
                ),
                Obx(() => enterPasscodeController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox()),
                const Spacer(),
                Obx(
                  () => enterPasscodeController.disableKeyboard.value
                      ? const SizedBox()
                      : CustomKeyboard(
                          controller: enterPasscodeController.enterController,
                          isForgot: true,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

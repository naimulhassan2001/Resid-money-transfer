import 'package:get/get.dart';

import '../../view/screen/create_account/create_account.dart';
import '../../view/screen/method/money_delivery_method.dart';
import '../../view/screen/method/money_delivery_method_cameroon.dart';
import '../../view/screen/method/money_delivery_resume.dart';
import '../../view/screen/notification/notification.dart';
import '../../view/screen/onboarding/onboarding_screen.dart';
import '../../view/screen/passcode/change_passcode/change_conform_passcode_screen.dart';
import '../../view/screen/passcode/change_passcode/change_passcode_screen.dart';
import '../../view/screen/passcode/change_passcode/new_passcode_screen.dart';
import '../../view/screen/passcode/confrom_passcode_screen.dart';
import '../../view/screen/passcode/create_passcode_screen.dart';
import '../../view/screen/passcode/enter_passcode_screen.dart';
import '../../view/screen/passcode/reset_passcode/reset_passcode_screen.dart';
import '../../view/screen/password/create_password_successful/create_password_successful_screen.dart';
import '../../view/screen/password/forgot_password_screen.dart';
import '../../view/screen/password/new_password/new_password_screen.dart';
import '../../view/screen/phone_number/phone_number.dart';
import '../../view/screen/profile/appearance/appearance_screen.dart';
import '../../view/screen/profile/edit_email/edit_email_screen.dart';
import '../../view/screen/profile/edit_phone/edit_phone_number.dart';
import '../../view/screen/profile/language/language_screen.dart';
import '../../view/screen/profile/legal/legal_screen.dart';
import '../../view/screen/profile/profile_info/profile_info.dart';
import '../../view/screen/profile/profile_screen/profile_screen.dart';
import '../../view/screen/profile/security/security_screen.dart';
import '../../view/screen/recipient/amount_send.dart';
import '../../view/screen/recipient/payment_method_final.dart';
import '../../view/screen/recipient/recipient_information.dart';
import '../../view/screen/select_country/select_country.dart';
import '../../view/screen/setting/setting_screen.dart';
import '../../view/screen/signIn/logIn_screen.dart';
import '../../view/screen/splash_screen/splash_screen.dart';
import '../../view/screen/support/contact_support.dart';
import '../../view/screen/test_screen/test_screen.dart';
import '../../view/screen/transaction_history/transaction_history.dart';
import '../../view/screen/transection/empty_transection.dart';
import '../../view/screen/transection/transaction.dart';
import '../../view/screen/transection/transaction_cancel_screen.dart';
import '../../view/screen/transection/transaction_success_screen.dart';
import '../../view/screen/verification/change_email_varification/change_email_verification.dart';
import '../../view/screen/verification/forgot_password_verification/forgot_password_verification.dart';
import '../../view/screen/verification/sign_up_verification/sign_up_verification.dart';
import '../../view/screen/welcome_screen/welcome_screen.dart';

class AppRoute {
  static const String test = "/test_screen.dart";







  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = "/onboard_screen";
  static const String phoneNumber = "/phone_Number";
  static const String signUpOtp = "/phone_Number_otp";
  static const String createAccount = "/create_account";
  static const String passCode = "/passcode_screen";
  static const String welcomeScreen = "/welcome_screen";
  static const String emptyTransaction = "/empty_transaction";
  static const String transaction = "/transaction";
  static const String notification = "/notification";
  static const String profile = "/profile_screen";
  static const String profileInfo = "/profile_info";
  static const String securityScreen = "/security_screen";
  static const String languageScreen = "/language_screen";
  static const String appearanceScreen = "/appearance_screen";
  static const String legalScreen = "/legal_screen";
  static const String transactionHistory = "/transaction_history";
  static const String contactSupport = "/contact_support";
  static const String selectCountry = "/select_country";
  static const String moneyDeliveryMethod = "/money_delivery_method";
  static const String recipient = "/recipient_information";
  static const String moneyDeliveryResume = "/money_delivery_resume.dart";

  static const String settingScreen = "/setting_screen.dart";
  static const String transactionSuccessScreen =
      "/transaction_success_screen.dart";
  static const String transactionCancelScreen =
      "/transaction_cancel_screen.dart";
  static const String conformPassCode = "/confrom_passcode_screen.dart";
  static const String amountSend = "/amount_send.dart";
  static const String paymentMethodFinal = "/payment_method_final.dart";
  static const String enterPassCode = "/enter_passcode_screen.dart";
  static const String changePasscode = "/change_passcode_screen.dart";
  static const String newPasscode = "/new_passcode_screen.dart";
  static const String changeConformPasscode =
      "/change_conform_passcode_screen.dart";
  static const String logIn = "/logIn_screen.dart";
  static const String forgotPassword = "/forgot_password_screen.dart";
  static const String forgotPasswordVerify =
      "/forgot_password_verification.dart";
  static const String newPassword = "/new_password_screen.dart";
  static const String createSuccessful =
      "/create_password_successful_screen.dart";
  static const String editEmail = "/edit_email_screen.dart";
  static const String changeEmailVerify = "/change_email_verification.dart";
  static const String changePhoneNumber = "/edit_phone_number.dart";
  static const String resetPasscode = "/reset_passcode_screen.dart";
  static const String deliveryMethodCameroon = "/money_delivery_method_cameroon.dart";

  static List<GetPage> routes = [
    GetPage(name: test, page: () => TestScreen()),



    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => const OnBoardingScreen()),
    GetPage(name: phoneNumber, page: () => const PhoneNumber()),
    GetPage(name: signUpOtp, page: () => SignUpVerification()),
    GetPage(name: createAccount, page: () => CreateAccount()),
    GetPage(name: passCode, page: () => CreatePasscodeScreen()),
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: emptyTransaction, page: () => const EmptyTransaction()),
    GetPage(name: transaction, page: () => Transaction()),
    GetPage(name: notification, page: () => Notification()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: profileInfo, page: () =>  ProfileInfo()),
    GetPage(name: securityScreen, page: () => SecurityScreen()),
    GetPage(name: languageScreen, page: () => LanguageScreen()),
    GetPage(name: appearanceScreen, page: () => const AppearanceScreen()),
    GetPage(name: legalScreen, page: () => LegalScreen()),
    GetPage(name: transactionHistory, page: () => TransactionHistory()),
    GetPage(name: contactSupport, page: () => ContactSupport()),
    GetPage(name: selectCountry, page: () => SelectCountry()),
    GetPage(name: moneyDeliveryMethod, page: () => MoneyDeliveryMethod()),
    GetPage(name: recipient, page: () => RecipientInformation()),
    GetPage(name: moneyDeliveryResume, page: () => const MoneyDeliveryResume()),
    GetPage(name: settingScreen, page: () => const SettingScreen()),
    GetPage(
        name: transactionSuccessScreen,
        page: () => TransactionSuccessScreen()),
    GetPage(name: conformPassCode, page: () => ConformPasscodeScreen()),
    GetPage(name: amountSend, page: () => AmountSendScreen()),
    GetPage(name: paymentMethodFinal, page: () => PaymentMethodFinal()),
    GetPage(name: enterPassCode, page: () => EnterPasscodeScreen()),
    GetPage(name: changePasscode, page: () => ChangePasscode()),
    GetPage(name: newPasscode, page: () => NewPasscodeScreen()),
    GetPage(
        name: changeConformPasscode,
        page: () => ChangeConformPasscodeScreen()),
    GetPage(name: logIn, page: () => LogInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(
        name: forgotPasswordVerify, page: () => ForgotPasswordVerification()),
    GetPage(name: newPassword, page: () => NewPasswordScreen()),
    GetPage(
        name: createSuccessful,
        page: () => const CreatePasswordSuccessfulScreen()),
    GetPage(name: editEmail, page: () => const EditEmailScreen()),
    GetPage(name: changeEmailVerify, page: () => ChangeEmailVerification()),
    GetPage(
        name: changePhoneNumber, page: () => EditPhoneNumberScreen()),
    GetPage(name: resetPasscode, page: () => ResetPasswordScreen()),
    GetPage(name: deliveryMethodCameroon, page: () => MoneyDeliveryMethodCameroon()),
    GetPage(name: transactionCancelScreen, page: () => TransactionCancelScreen()),
  ];
}

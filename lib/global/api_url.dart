

class ApiUrl {


  ///========================================> exchangeApi <==================================

  static const String exchangeApi = "http://api.exchangeratesapi.io/v1/latest?access_key=e3f73a368e78b975be3d1048e30b9e8f" ;


  ///========================================> exchangeApi <==================================




  static const String baseUrl = "http://192.168.18:3000" ;
  // static const String baseUrl = "http://192.168.10.18:3000" ;


  static const String signUp = "$baseUrl/api/users/sign-up" ;
  static const String allTransactions = "$baseUrl/api/transactions" ;
  static const String createPasscode = "$baseUrl/api/users/passcode" ;
  static const String signIn = "$baseUrl/api/users/sign-in" ;
  static const String verifyPasscode = "$baseUrl/api/users/verify-passcode" ;
  static const String forgetPassword = "$baseUrl/api/users/forget-password" ;
  static const String verifyOtp = "$baseUrl/api/users/verify-otp" ;
  static const String resetPassword = "$baseUrl/api/users/reset-password" ;
  static const String signInWithPasscode = "$baseUrl/api/users/sign-in-with-passcode" ;
  static const String transaction = "$baseUrl/api/transactions" ;
  static const String countries = "$baseUrl/api/countries" ;
  static const String hiddenFee = "$baseUrl/api/hidden-fees" ;
  static const String termsOfMoneyTransfer = "$baseUrl/api/terms-of-money-transfers" ;
  static const String termsOfService = "$baseUrl/api/terms-of-services" ;
  static const String personalDataPolicies = "$baseUrl/api/personal-data-policies" ;
  static const String refundAndCancellationPolicy = "$baseUrl/api/refund-and-cancellation-policies" ;
  static const String user = "$baseUrl/api/users" ;
  static const String localAuth = "$baseUrl/api/users/sign-in-with-refresh-token" ;
  static const String notification = "$baseUrl/api/notifications" ;
  static const String paymentInfo = "$baseUrl/api/payment-info" ;
  static const String verifyOldPasscode = "$baseUrl/api/users/verify-old-passcode" ;
  static const String changePasscode = "$baseUrl/api/users/change-passcode" ;
  static const String confirmTransaction = "$baseUrl/api/transactions/confirm" ;


}
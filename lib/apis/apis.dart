
class ApiUrls {

  static const String apiBaseUrl = 'https://kidsstory.laraveldevelopmentcompany.com/api/';
  static const String loginApi = "${apiBaseUrl}login";
  static const String googleLogin = "${apiBaseUrl}google/login/";
  static const String appleLogin = "${apiBaseUrl}apple-login";
  static const String logoutApi = "${apiBaseUrl}logout";
  static const String userDelete = "${apiBaseUrl}user-delete";
  static const String signUp = "${apiBaseUrl}register";
  static const String forgotPassword = "${apiBaseUrl}forgot-password";
  static const String otpVerify = "${apiBaseUrl}verify-reset-password-otp";
  static const String otpVerifyAuth = "${apiBaseUrl}account-verification-otp";
  static const String resetPass = "${apiBaseUrl}reset-password";
  static const String updatePass = "${apiBaseUrl}update-password";
  static const String getSubsList = "${apiBaseUrl}get-subscription-list";
  static const String getSubsCancelOtp = "${apiBaseUrl}subscription-cancel";
  static const String cancelSubscriptionPlans = "${apiBaseUrl}cancel-subscription-plains";
  static const String postCancelSubscriptionOtp = "${apiBaseUrl}cancel-subscription-otp";
  static const String userSubscriptionDetail = "${apiBaseUrl}user-subscription-detail";
  static const String getStories = "${apiBaseUrl}get-stories/";
  static const String childInterest = "${apiBaseUrl}get-allGenre";
  static const String currentStoryAEndPoint = "${apiBaseUrl}current-day-story";
  static const String storyDetails = "${apiBaseUrl}get-story-detail/";
  static const String createChildProfile = "${apiBaseUrl}create-child-profile";
  static const String updateChildProfile = "${apiBaseUrl}update-child-profile/";
  static const String getUserChildrenDetail = "${apiBaseUrl}get-user-children-detail";
  static const String userBuySubscription = "${apiBaseUrl}buy-user-subscription";
  static const String fcmToken = "${apiBaseUrl}add-device-token";

  ////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const String verifyLogin = "${apiBaseUrl}verified-login";
  static const String signUpOtp = "${apiBaseUrl}sing-up-otp";

}

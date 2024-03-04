abstract class EndPoint {
    static const String baseUrl = "https://renter-api.ksbgarage.com/";
  static const String LOGIN_END_POINT = "auth/login/mobile";
  static const String REGISTER_END_POINT = "/auth/register/client";
  static const String FACEBOOK_LOGIN_END_POINTS = "auth/social/callback";
  // ads
  static const String ADS_END_POINTS = "/users/ads";

  // verifyEmail
  static const String VERIFY_EMAIL_END_POINT = "auth/verify_user";
  static const String RESEND_VERIFY_EMAIL_END_POINT = "auth/verify_user/resend";

  // product
  static const String GET_PRODUCT_END_POINT = "mobile/client/products";
  static const String GET_PRODUCT_BY_BARCODE = "products/by_bar_code?bar_code=";

  // favourite

    static const String TOGGLE_FAVOURITE_END_POINT = "api/favorites/toggle";

    // profile
    static const String GET_PROFILE_END_POINT = "auth/profile";
    static const String UPDATE_PROFILE_END_POINT = "auth/profile";
    static const String CHANGE_PASSWORD_END_POINT = "auth/password/change_password";
    static const String LOGOUT_END_POINT = "auth/logout";
    static const String REMOVE_ACCOUNT_END_POINT = "auth/remove_account";
    // reset password
    static const String SEND_FORGET_PASSWORD_END_POINT = "auth/password/forgot_password";
    static const String RESET_PASSWORD_END_POINT = "auth/password/reset_password";
    // visit history
     static const String GET_VISIT_HISTORY_END_POINT = "api/mobile/visits";

     // carFixes

      static const String CAR_FIXES_END_POINT = "api/mobile/client/car_fixes";
      static const String CAR_FIXES_PDF_END_POINT = "/api/exports/car_fixes/";
      static const String CAR_FIXES_REVIEW = "/api/mobile/client/car_fixes";

      // grage car
      static const String GRAGE_CAR_END_POINT = "users/cars_models";
      static const String GET_BRANDS = "select_menu/brands";

      // notification
      static const String GET_NOTIFICATION_END_POINT = "notifications";
      static const String GET_UNREAD_COUNT_NOTIFICATION = "notifications/unread_notifications_count";

      // contact us
    static const String contactUSEndPoint = "users/contact_us";

      // visitor Car
      static const String VISITOR_CAR_END_POINT = "api/mobile/visitors_cars";
      // brand end point

      static const String  BRAD_END_POINT= "public/brands";

//////// about us
  static const String  aboutUsEndPoint= "users/about_us";


//////// terms and condition

  static const String  termsAndConditionUrl= "public/terms_and_conditions";


  ///////////////////////////////a to z ///////////////////////////////////

  static const String  showAllBranch= "/public/branches?page=";
  static const String  getAllCartItem= "/api/cart";
  static const String  productEndPoint= "client/products";


}

import 'dart:convert';
import 'package:ksb/core/helpers/cach_helpers/cach_helpers.dart';

import '../../data/model/login_model/login_model/login_model.dart';

class CachingData {
  static const String _loginKey = 'UserModel';
  CachingData._();

  static CachingData instance = CachingData._();

  void cachLoginInfo(LoginModel loginModel) async {
    await CacheHelper.put(
        key: _loginKey, value: jsonEncode(loginModel.toJson()));
  }

   LoginModel? getCachedLogin()
   {
     String ?loginJson = CacheHelper.getDataString(key: _loginKey);
    if(loginJson == null) return null;
    return LoginModel.fromJson(jsonDecode(loginJson));
  }

}

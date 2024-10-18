import 'package:empty_code/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!---- Keys  ------

  String prefFirstLunch = 'first_lunch';
  String prefIsLogged = 'logged_in';
  String prefLoginInfo = 'login_info';
  String prefTokenInfo = 'token_info';
  String prefAppLang = 'app_language';
  String prefCartList = 'cart_list';

  void setLoggedIn(bool value) {
    setPrefrenc(type: DataType.bool, key: prefIsLogged, value: value);
  }

  bool getLoggedIn() {
    if (pref.containsKey(prefIsLogged)) {
      return getPrefrence(prefIsLogged);
    } else {
      return false;
    }
  }

  void setFirstLunch(bool value) {
    setPrefrenc(type: DataType.bool, key: prefFirstLunch, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(prefFirstLunch)) {
      return getPrefrence(prefFirstLunch);
    } else {
      return true;
    }
  }

  // RememberMe getLoginInfo() {
  //   if (pref.containsKey(PREF_LOGIN_INFO))
  //   return RememberMe.fromJson(jsonDecode(getPrefrence(PREF_LOGIN_INFO)));
  //   else
  //    return RememberMe(username: '', password: '', rememberme: false);

  // }

  // void setLoginInfo(RememberMe value) {
  //   setPrefrenc(
  //       type: DataType.STRING,
  //       key: PREF_LOGIN_INFO,
  //       value: jsonEncode(value.toJson()));
  // }

  // void setTokenInfo(TokenInfo token) {
  //   setPrefrenc(
  //       type: DataType.STRING,
  //       key: PREF_TOKEN_INFO,
  //       value: jsonEncode(token.toJson()));
  // }

  // TokenInfo getTokenInfo() {
  //   return TokenInfo.fromJson(jsonDecode(getPrefrence(PREF_TOKEN_INFO)));
  // }

  void setAppLanguage(String code) {
    setPrefrenc(type: DataType.string, key: prefAppLang, value: code);
  }

  String getAppLanguage() {
    if (pref.containsKey(prefAppLang)) {
      return getPrefrence(prefAppLang);
    } else {
      return 'en';
    }
  }
  // void setCartList(List<CartModel> list) {
  //   setPrefrenc(
  //       type: DataType.STRING,
  //       key: PREF_CART_LIST,
  //       value: CartModel.encode(list));
  // }

  // List<CartModel> getCartList() {
  //   if (pref.containsKey(PREF_CART_LIST))

  //     return CartModel.decode(getPrefrence(PREF_CART_LIST));
  //   else
  //     return [];
  // }

  //*====================================

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.int:
        await pref.setInt(key, value);
        break;
      case DataType.string:
        await pref.setString(key, value);
        break;
      case DataType.bool:
        await pref.setBool(key, value);
        break;
      case DataType.double:
        await pref.setDouble(key, value);
        break;
      case DataType.liststring:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }
}

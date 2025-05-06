// ✅ File: cache_helper.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/sign_up_screen/model/sign_up_model.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveLoginData(SignUpModel user) async {
    await _prefs?.setString('phone', user.phone);
    await _prefs?.setString('password', user.password);
    await _prefs?.setString('firstName', user.firstName);
    await _prefs?.setString('lastName', user.lastName);
    await _prefs?.setString('email', user.email);
    await _prefs?.setString('birth', user.birth);
  }

  static SignUpModel? getLoginData() {
    String? phone = _prefs?.getString('phone');
    String? password = _prefs?.getString('password');
    String? firstName = _prefs?.getString('firstName');
    String? lastName = _prefs?.getString('lastName');
    String? email = _prefs?.getString('email');
    String? birth = _prefs?.getString('birth');

    if (phone != null && password != null) {
      return SignUpModel(
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        email: email ?? '',
        phone: phone,
        password: password,
        confirmPassword: '',
        birth: birth ?? '',
      );
    }
    return null;
  }

  static Future<void> clearLoginData() async {
    await _prefs?.remove('phone');
    await _prefs?.remove('password');
    await _prefs?.remove('firstName');
    await _prefs?.remove('lastName');
    await _prefs?.remove('email');
    await _prefs?.remove('birth');
    await _prefs?.remove('userId');
  }

  static Future<void> saveUserId(int value) async {
    await _prefs?.setInt('userId', value);
  }

  static int? getUserId() {
    return _prefs?.getInt('userId');
  }

  static Future<void> removeData({required String key}) async {
    await _prefs?.remove(key);
  }
}

// ✅ File: login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/authentaction_model/auth_model.dart';
import 'package:code_quest/modules/sign_up_screen/model/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../network/local/cash_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final dio = Dio();
  static int userId = 0;

  void login(String phone, String password) async {
    try {
      emit(LoginLoading());

      final response = await dio.post(
        "https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/login",
        data: {
          "phoneNum": phone,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        AuthModel userData = authModelFromJson(response.data as Map<String, dynamic>);
        userId = userData.userId;

        await CacheHelper.saveUserId(userId);

        await CacheHelper.saveLoginData(
          SignUpModel(
            firstName: '',
            lastName: '',
            email: '',
            phone: phone,
            password: password,
            confirmPassword: '',
            birth: '',
          ),
        );

        emit(LoginSuccess());
      } else if (response.statusCode == 401) {
        emit(LoginFailure("Invalid phone number or password"));
      } else {
        emit(LoginFailure("Something went wrong"));
      }
    } catch (e) {
      emit(LoginFailure("⚠️ ${e.toString()}"));
    }
  }

  Future<void> logout() async {
    await CacheHelper.removeData(key: 'userId');
    userId = 0;
    emit(LoginInitial());
  }
}

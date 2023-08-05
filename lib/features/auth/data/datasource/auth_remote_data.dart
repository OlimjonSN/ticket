import 'package:dio/dio.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';

class AuthRemoteData {
  final Dio dio;

  AuthRemoteData({required this.dio});
  // registeration
  Future register({required UserModel usermodel, required String password, required String password1}) async {
    Response res = await dio.post(
      '/user/registration/',
      data: usermodel.toJson()..addAll({'password': password, 'password1': password1}),
        
    );
    return res.statusCode ?? 400;
  }

  // login
  Future login({required String username, required String password}) async {
    Response res = await dio.post(
      '/user/login/',
      data: {
        'username': username,
        'password': password,
      },
    );
    return res.statusCode ?? 400;
  }
}

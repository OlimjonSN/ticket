import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';
import 'package:ticket/injection.dart';

class AuthRemoteData {
  final Dio dio;

  AuthRemoteData({required this.dio});
  // registeration
  Future register({required UserModel usermodel, required String password, required String password1}) async {
    Response res = await dio.post(
      '/user/registration/',
      data: usermodel.toJson()..addAll({'password': password, 'password1': password1}),
    );
    sl<Dio>().options.headers['X-CSRFToken'] = Cookie.fromSetCookieValue(res.headers['set-cookie']![0]).value;

    if (res.statusCode != 201) {
      throw Exception('Error');
    }

    return usermodel;
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
    sl<Dio>().options.headers['X-CSRFToken'] = Cookie.fromSetCookieValue(res.headers['set-cookie']![0]).value;
    if (res.statusCode != 200) {
      throw Exception('Error');
    }
    return UserModel.fromJson(res.data);
  }
}

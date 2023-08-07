import 'package:flutter/material.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';
import 'package:ticket/features/auth/data/repositories/auth_repositories.dart';

enum Status { uinitialized, authenticated, authenticating, unauthenticated, error }

class AuthProvider with ChangeNotifier {
  AuthRepositories authRepositories;
  AuthProvider({required this.authRepositories});
  UserModel? userModel;
  String? error;
  Status status = Status.uinitialized;

  Future<UserModel> register(UserModel userModel, String password, String password1) async {
    try {
      status = Status.authenticating;
      userModel = await authRepositories.register(userModel, password, password1);
      status = Status.authenticated;
      return userModel;
    } on Exception catch (e) {
      status = Status.error;
      error = 'Invalid email or password $e';
      notifyListeners();
      throw Exception(e);
    }
  }
  Future<UserModel> login(String email, String password) async {
    try {
      status = Status.authenticating;
      userModel = await authRepositories.login(email, password);
      status = Status.authenticated;
      return userModel!;
    } on Exception catch (e) {
      status = Status.error;
      error = 'Invalid email or password $e';
      notifyListeners();
      throw Exception(e);
    }
  }
}

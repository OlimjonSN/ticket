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

  Future<void> register(UserModel userModel, String password, String password1) async {
    try {
      status = Status.authenticating;
      notifyListeners();
      userModel = await authRepositories.register(userModel, password, password1);
      status = Status.authenticated;
      notifyListeners();
    } catch (e) {
      status = Status.error;
      notifyListeners();
      error = 'Invalid email or password $e';
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      status = Status.authenticating;
      notifyListeners();
      userModel = await authRepositories.login(email, password);
      status = Status.authenticated;
      notifyListeners();

 
    } on Exception catch (e) {
      status = Status.error;
      notifyListeners();

      error = 'Invalid email or password $e';
      notifyListeners();
    
    }
  }
}

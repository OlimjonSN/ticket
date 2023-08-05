import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';

class AuthLocalData {
  SharedPreferences sharedPreference;
  AuthLocalData({required this.sharedPreference});

  //save model
  Future<void> saveUserModel(UserModel userModel) async {
    await sharedPreference.setString('userModel', jsonEncode(userModel.toJson()));
  }

  //get model
  Future<UserModel> getUserModel() async {
    String? userModelString = sharedPreference.getString('userModel');
    if (userModelString != null) {
      return UserModel.fromJson(jsonDecode(userModelString));
    } else {
      throw Exception('No user model found');
    }
  }
}

import 'package:ticket/core/network/network_info.dart';
import 'package:ticket/features/auth/data/datasource/auth_local_data.dart';
import 'package:ticket/features/auth/data/datasource/auth_remote_data.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';

class AuthRepositories {
  NetworkInfo networkInfo;
  AuthLocalData authLocalData;
  AuthRemoteData authRemoteData;

  AuthRepositories({
    required this.networkInfo,
    required this.authLocalData,
    required this.authRemoteData,
  });

  Future<UserModel> register(UserModel userModel, String password, String password1) async {
    if (await networkInfo.isConnected) {
      //register

      UserModel userM = await authRemoteData.register(usermodel: userModel, password: password, password1: password1);
      
      await authLocalData.saveUserModel(userM);

      return userM;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<UserModel> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      //register
      UserModel userM = await authRemoteData.login(
        username: email,
        password: password,
      );
      await authLocalData.saveUserModel(userM);
      return userM;
    } else {
      throw Exception('No internet connection');
    }
  }
}

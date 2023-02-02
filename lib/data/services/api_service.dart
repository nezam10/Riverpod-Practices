import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/values/api_url.dart';
import '../../main.dart';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

final apiServicesProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  ApiService() {
    print('=== api service constractor');
  }
  Future<UserModel?> getSingleUserInfo(String token) async {
    final String apiUrl = ApiURL.getSingleUserInfoUrl;
    print('url $apiUrl');
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer $token"
    };
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: header);
      if (response.statusCode == 200) {
        var userInfo = UserModel.fromJson(jsonDecode(response.body)['user']);
        bool isSetUser = await setUser(userInfo);
        if (isSetUser) {
          return userInfo;
        }
      }
    } catch (error) {
      print('get single user   not fund $error');
    }
  }

  //
  Future<bool> setUser(UserModel userModel) async {
    try {
      String user = jsonEncode(userModel);
      bool result = await preferences.setString("userInfo", user);
      if (result) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('set user $error');
      return false;
    }
  }
}

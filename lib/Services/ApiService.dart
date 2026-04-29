import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
class ApiService{
  static final _baseUrl = "http://192.168.10.153.153:8000/api/v1/users";
  static const _storage = FlutterSecureStorage();

  static Future<void> save_tokens(String access,String refresh)async{
    await _storage.write(key: "AccessToken", value: access);
    await _storage.write(key: "RefreshToken", value: refresh);

  }
  static Future<String?> getAcessToken()async{
    return await _storage.read(key: "AccessToken");
  }
  static Future<String?> getRefreshToken()async{
    return await _storage.read(key: "RefreshToken");
  }
  static Future<void> clearTokens()async{
    await _storage.deleteAll();
  }
  static Future<String?> refreshAccessToken() async{
    final refreshtoken = await getRefreshToken();
    if(refreshtoken == null) return null;
    final response = await http.post(
        Uri.parse("$_baseUrl/login/refresh/"),
        headers: {
          "Content-Type":"application/json"
        },
        body: jsonEncode({"refresh":refreshtoken}
        )
    );
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      final newAccessToken = data['access'];
      final newRefreshToken = data['refresh'];
      await _storage.write(key: "AccessToken", value: newAccessToken);
      print("access token refreshed");
      if(newRefreshToken != null){
        await _storage.write(key: "RefreshToken", value: newRefreshToken);
      }
      return newAccessToken;
    }else{
      print("failed to refresh access tokens");
      await clearTokens();
    }
    return null;
  }
  static Future<http.Response> AuthorizedRequest(
      Future<http.Response> Function(String token) requestFn)async{
    String? accessToken = await getAcessToken();
    http.Response response = await requestFn(accessToken ?? '');
    if(response.statusCode == 401){
      accessToken = await refreshAccessToken();
      if(accessToken != null){
        response = await requestFn(accessToken);
      }

    }

    return response;
  }
}
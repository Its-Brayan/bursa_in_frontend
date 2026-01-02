import 'dart:convert';
import 'package:bursary_inn/Models/UserModel.dart';
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  final _storage = FlutterSecureStorage();
  final baseURL = "http://10.33.27.1:8000/api/v1/users";

  Future<Map<String,dynamic>> register_user(UserModel user) async{
    final response = await http.post(
        Uri.parse("$baseURL/signup/student/"),
        headers: {
          "Content-Type":"application/json"
        },
        body: jsonEncode(user.toJson())
    );
    final Map<String,dynamic> responsedata = jsonDecode(response.body);
    if(response.statusCode == 201){
      // final tokens = responsedata['data'];
      // final message = responsedata['success'];
      // await ApiService.save_tokens(tokens['access'], tokens['refresh']);

      return{
        "success":true,
        "data":responsedata,
      };
    }else{

      return{
        "success":false,
        "error":responsedata,
      };
    }
  }
  Future<Map<String,dynamic>> login_user(UserModel user) async{
    final response = await http.post(
        Uri.parse("$baseURL/login/"),
        headers: {
          "Content-Type":"application/json"
        },
        body:jsonEncode(user.toLoginJson())
    );
    final Map<String,dynamic> responsedata = jsonDecode(response.body);
    if(response.statusCode == 200){
      print("User logged in successfully");
      // final tokens = responsedata['data'];
      print(response.body);
      await ApiService.save_tokens(responsedata['access'],responsedata['refresh']);
      return{
        "success":true,
        "data":responsedata,
      };
    }else{
      print("failed to login user");
      print("${response.body}");
      return {
        "success":false,
        "error":responsedata
      };
    }
  }
}
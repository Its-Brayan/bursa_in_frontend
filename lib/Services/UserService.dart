import 'dart:convert';
import 'package:bursary_inn/Models/UserModel.dart';
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class UserService {
  final _storage = FlutterSecureStorage();
  final baseURL = "https://bursa-in-backend.onrender.com/api/v1/users";
  final baseURl2 = "https://bursa-in-backend.onrender.com/api/v1/applications";
 /* final GoogleSignIn _googleSignin = GoogleSignIn.standard(
    scopes:<String> ['email',
      'https://www.googleapis.com/auth/userinfo.profile',]
  );*/

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
      print(response.body);
      return {
        "success":false,
        "error":responsedata
      };
    }
  }
/*  Future<void> login_with_google()async{
    try{
      final GoogleSignInAccount? google_user = await _googleSignin.sig
    }
  }*/
  Future <Map<String,dynamic>?> get_student_profile() async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseURL/me/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 200){
      print("Student details fetched successfully");
      final data = jsonDecode(response.body);
      print(data);
      return data;
    }else{
      return null;
    }
  }
  Future<void> check_student_details_completion_navigate(BuildContext context)async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseURl2/check_student_details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final status = data['status'];
      if(status == 'complete'){
      Navigator.pushReplacementNamed(context, '/home');
      print("Navigating to home");
      }else if(status == 'partial'){
        Navigator.pushReplacementNamed(context, '/alldetails');
      }else if(status == 'empty'){
        Navigator.pushReplacementNamed(context, '/alldetails');
      }
    }else{
      print('Erorr checking profile:${response.body}');
    }
  }

  Future<Map<String,dynamic>> get_student_completion_status()async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseURl2/check_student_details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data;
    }else{
      print("Error checking student details ${response.body}");
      return {};
    }
  }
  Future<void> sendOTP(String email) async {
   final response = await http.post(
      Uri.parse("${baseURL}/forgot_password/"),
      body: jsonEncode({
        "email": email
      }),
      headers: {
        "Content-Type":"application/json"
      }
    );
   print(jsonDecode(response.body));
  }
  Future<bool> verify_otp({required String email,required String otp}) async{
  final response = await http.post(
    Uri.parse("$baseURL/verify_otp/"),
    body: jsonEncode({
      "email": email,
      "otp": otp,
    }),
    headers: {
      "Content-Type":"application/json"
    }
  );
  if(response.statusCode == 200){
    return true;
  }else{
    return false;
  }
  }
  Future<bool> reset_password({required String email, required String otp, required String password})async{
    final response = await http.post(
      Uri.parse("$baseURL/reset_password/"),
      body: jsonEncode(
          {
            'email': email,
            'otp': otp,
            'password':password
          }
      ),
      headers: {
        "Content-Type":"application/json"
      }
    );
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      print(data);
      return true;
    }else{
      print(data);
      return false;
    }
  }
}

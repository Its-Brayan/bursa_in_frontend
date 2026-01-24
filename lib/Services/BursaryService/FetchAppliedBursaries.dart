import 'dart:convert';
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';

class FetchAppliedBursaries {
  final baseURL = "http://10.33.27.1:8000/api/v1/programs";
  Future<List<dynamic>> fetch_applied_bursaries() async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseURL/my_applications/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    }else{
      print(response.body);
      return [];
    }
  }
}
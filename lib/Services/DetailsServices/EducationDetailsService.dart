import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Models/DetailsPage/EducationDetails.dart';
import 'package:bursary_inn/Services/ApiService.dart';

class Educationdetailsservice {
  final baseUrl = "http://192.168.58.153:8000/api/v1/applications";

  Future<Map<String,dynamic>> create_education_details(EducationDetails education)async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.post(
          Uri.parse("$baseUrl/education-details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
          body: jsonEncode(education.toJson())
        )
    );
    final responsedata = jsonDecode(response.body);
    if(response.statusCode == 201){
      print(responsedata);
      return{
        "success":true,
        "data":responsedata
      };
    }else{
      print(responsedata);
      return{
        "success":false,
        "error":responsedata
      };
    }
    
  }
  Future<EducationDetails?> get_education_details() async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseUrl/get/education-details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 200){
      final Map<String,dynamic> data = jsonDecode(response.body);
      print(data);
      return EducationDetails.fromJson(data);
    }
    return null;
  }
  Future<Map<String,dynamic>> update_education_details(EducationDetails education) async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.put(
          Uri.parse("$baseUrl/update/education-details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
          body:jsonEncode(education.toJson())
        )
    );
    if(response.statusCode == 200){
      final Map<String,dynamic> data = jsonDecode(response.body);
      print("Successfully updated student edcuation details");
      return{
        'success':true,
        'data':data
      };
    }else{
      print("failed to update student eduction details");
      return {
        'success':false,
        'error':response.body
      };
    }
  }
}
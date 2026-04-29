import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bursary_inn/Models/DetailsPage/PersonalDetails.dart';
import 'package:bursary_inn/Services/ApiService.dart';
class Personaldetailsservice {
  final baseURL = "http://192.168.10.153:8000/api/v1/applications";
  Future<Map<String,dynamic>> create_personal_details(PersonalDetails person) async{
    final response = await ApiService.AuthorizedRequest(
        (token) =>
          http.post(
            Uri.parse("$baseURL/personal-details/"),
            headers: {
              "Content-Type":"application/json",
              "Authorization":"Bearer $token"
            },
            body:jsonEncode(person.toJson())
          ),
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
  Future<PersonalDetails?> fetch_personal_details()async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseURL/get/student-personal-details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 200){
      final Map<String,dynamic> data = jsonDecode(response.body);
      print(data);
      return PersonalDetails.fromJson(data);
    }else{
      print("Failed to fetch student personal details");
    }
    return null;
  }
  Future<Map<String,dynamic>> update_personal_details(PersonalDetails student) async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.patch(
          Uri.parse("$baseURL/update/personal-details/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
          body: jsonEncode(student.toJson())
        )
    );
    if(response.statusCode == 200){
      final Map<String,dynamic> data = jsonDecode(response.body);
      print(data);
      return {
        'success':true,
        'data':data,
      };
    }else{
      print(response.body);
       return {
         'success':false,
         'error':response.body
       };
    }
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bursary_inn/Models/DetailsPage/PersonalDetails.dart';
import 'package:bursary_inn/Services/ApiService.dart';
class Personaldetailsservice {
  final baseURL = "http://10.33.27.1:8000/api/v1/applications";
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
}
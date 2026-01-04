import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Models/DetailsPage/FamilyDetails.dart';

class Familydetailsservice {
  final baseUrl = "http://10.33.27.1:8000/api/v1/applications";
  
  Future<Map<String,dynamic>> create_family_details(FamilyDetails family) async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.post(
          Uri.parse("$baseUrl/familydetails/"),
          headers:{
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
          body: jsonEncode(family.toJson())
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
}
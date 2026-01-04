import 'dart:convert';

import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Models/DetailsPage/DocumentDetails.dart';
import 'package:http/http.dart' as http;

class Documentdetailsservice {
  final baseUrl = "http://10.33.27.1:8000/api/v1/applications";
  
  Future<Map<String,dynamic>> create_document_details(Documentdetails documents)async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.post(
          Uri.parse("$baseUrl/document-uploads/"),
          headers: {
            "Content-Type":"application/json",
             "Authorization":"Bearer $token"
          },
          body: jsonEncode(documents.toJson())
        )
    );
    final responsedata = jsonDecode(response.body);
    if(response.statusCode == 201){
      return{
        "success":true,
        "data":responsedata
      };
    }else{
      return{
        "success":false,
        "error":responsedata
      };
    }
  }
}
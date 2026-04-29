import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';

class BursaryApplicationService {
  final baseUrl = "http://192.168.10.153:8000/api/v1/programs";

  Future<bool> apply_for_bursary(int bursaryId) async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.post(
          Uri.parse(
            "$baseUrl/apply_bursary/"
          ),
          headers:{
            "Content-Type": "application/json",
            "Authorization":"Bearer $token"
          },
          body: jsonEncode({
            'bursary': bursaryId,

          })
        )
    );
    if(response.statusCode == 201){
      print("Bursary applied successfully");
      return true;
    }else{
      print(response.body);
      return false;
    }
  }
}
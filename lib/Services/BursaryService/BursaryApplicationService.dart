import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';

class BursaryApplicationService {
  final baseUrl = "http://10.33.27.1:8000/api/v1/programs";

  Future<bool> apply_for_bursary(int bursary_id) async{
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
            'bursary': bursary_id,

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
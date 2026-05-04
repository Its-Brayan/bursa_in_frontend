import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:bursary_inn/Services/ApiService.dart';

class AllavailableService{
  final baseURL = "https://bursa-in-backend.onrender.com/api/v1/programs";
  Future<List<BursaryDetail>> get_all_bursaries()async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseURL/createbursary/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    print(response.body);
    if(response.statusCode == 200){
      final decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['results'];
      print(data);
      print("Bursaries fetched successfully");
      return data.map((item)=>BursaryDetail.fromJson(item)).toList();
    }else{
      print("Failed to fetch all bursaries");
      return [];
    }
  }
}
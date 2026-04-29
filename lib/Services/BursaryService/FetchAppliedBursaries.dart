import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';

class FetchAppliedBursaries {
  final baseURL = "http://192.168.10.153:8000/api/v1/programs";
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
  Future<bool> delete_applied_bursary(int id)async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.delete(
          Uri.parse("$baseURL/delete_application/${id}/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        )
    );
    if(response.statusCode == 204){
      print("bursary deleted successfully $response.body");
      return true;
    }else{
      print(response.body);
      return false;
    }
  }
}
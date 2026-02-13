import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:bursary_inn/Services/ApiService.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Favoriteservice {
  final baseurl = "http://10.33.27.1:8000/api/v1/programs";
  Future<void> toggle_favorite(BursaryDetail bursary)async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.post(
          Uri.parse("$baseurl/favorites/${bursary.id}/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
        ),
    );
    if(response.statusCode == 201){
      bursary.isFavorite = !bursary.isFavorite;
      print("it worked");
    }else{
      print("Error toggling favourites ${response.body}");
    }
  }
  Future<List<dynamic>> fetch_favorite_bursaries()async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseurl/my_favorites/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          }
        ),
    );

    if(response.statusCode == 200){
     final List<dynamic> data = jsonDecode(response.body);
     print(data);
     return data;
    }else{
      print("Failed to fetch favorite bursaries");
      return [];
    }
  }
}
import 'dart:convert';
import 'dart:math';

import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Favoriteservice extends ChangeNotifier {

  final baseurl = "http://192.168.58.153:8000/api/v1/programs";
  Future<void> toggle_favorite(BursaryDetail bursary)async {
    final previous = bursary.isFavorite;
    bursary.isFavorite = !bursary.isFavorite;
    notifyListeners();
    try {
      final response = await ApiService.AuthorizedRequest(
            (token) =>
            http.post(
              Uri.parse("$baseurl/favorites/${bursary.id}/"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
            ),
      );
      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception();
      }
    }
    catch(e) {
      bursary.isFavorite = previous;
      notifyListeners();

  }
  }

  Future<List<dynamic>> get_favorites()async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.get(
          Uri.parse("$baseurl/my_favorites/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
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
}
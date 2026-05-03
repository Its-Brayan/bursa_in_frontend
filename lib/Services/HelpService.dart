import 'dart:convert';

import 'package:bursary_inn/Models/HelpModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';

class Helpservice {
  final baseUrl = "http://192.168.58.153:8000/api/v1/support";
  Future<void> create_help(HelpModel help) async{
    final response = await ApiService.AuthorizedRequest(
        (token) => http.post(
          Uri.parse("$baseUrl/sendhelp/"),
          headers: {
            "Content-Type":"application/json",
            "Authorization":"Bearer $token"
          },
          body: jsonEncode(help.toJson())
        )
    );
    final responsedata = jsonDecode(response.body);
    if(response.statusCode == 201){
      print(responsedata);
    }else{
      print(responsedata);
    }
  }

}
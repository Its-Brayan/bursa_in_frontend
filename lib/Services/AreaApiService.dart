import 'dart:convert';
import 'package:http/http.dart' as http;

class Areaapiservice {
  Future<Map<String,dynamic>> fetch_kenyan_areas() async{
    final response = await http.get(
      Uri.parse('https://kenyaareadata.vercel.app/api/areas?apiKey=keyPub1569gsvndc123kg9sjhg'),

    );
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception('failed to load area data');
    }
  }
}
import 'dart:convert';

import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Models/DetailsPage/DocumentDetails.dart';
import 'package:http/http.dart' as http;

class Documentdetailsservice {
  final baseUrl = "http://10.33.27.1:8000/api/v1/applications";
  
  Future<Map<String,dynamic>> create_document_details(DocumentDetails documents)async{
    final response = await ApiService.AuthorizedRequest((token) async {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse("$baseUrl/document-uploads/")
      );
      request.headers['Authorization'] = 'Bearer $token';
      if (documents.id_document != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'id_document',
            documents.id_document!.path)
        );
      }
      if (documents.school_id != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'school_id',
            documents.school_id!.path));
      }
      if (documents.student_transcript != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'student_transcript',
            documents.student_transcript!.path));
      }
      if (documents.admission_letter != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'admission_letter',
            documents.admission_letter!.path));
      }
      if (documents.fee_structure != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'fee_structure',
            documents.fee_structure!.path));
      }
      if (documents.fee_structure != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'approval_letter', documents.approval_letter!.path));
      }
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return response;
    });
    final data = jsonDecode(response.body);
    if(response.statusCode == 201){
      print(data);
      return{
        "success":true,
        "data":data
      };
    }else{
      print(data);
      return{
        "success":false,
        "error":data
      };
    }


  }
}
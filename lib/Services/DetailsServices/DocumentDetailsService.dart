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
      if (documents.death_certificate_father != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'death_certificate_father', documents.death_certificate_father!.path));
      }
      if(documents.death_certificate_mother != null){
        request.files.add(await http.MultipartFile.fromPath(
            'death_certificate_mother', documents.death_certificate_mother!.path));
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
  Future<DocumentDetails?> fetch_document_uploads()async {
    final response = await ApiService.AuthorizedRequest(
            (token) =>
            http.get(
                Uri.parse("$baseUrl/get/document-uploads/"),
                headers: {
                  "Content-Type": "application/json",
                  "Authorization": "Bearer $token"
                }
            )
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return DocumentDetails.fromJson(data);

    }
  }
  Future<Map<String,dynamic>> update_document_details(DocumentDetails documents)async {
    final response = await ApiService.AuthorizedRequest((token) async {
      var request = http.MultipartRequest(
          'PATCH',
          Uri.parse("$baseUrl/update/document-uploads/")
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
      if (documents.death_certificate_father != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'death_certificate_father', documents.death_certificate_father!.path));
      }
      if(documents.death_certificate_mother != null){
        request.files.add(await http.MultipartFile.fromPath(
            'death_certificate_mother', documents.death_certificate_mother!.path));
      }
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return response;
    });
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
      return {
        "success": true,
        "data": data
      };
    } else {
      print(data);
      return {
        "success": false,
        "error": data
      };
    }
  }
  }
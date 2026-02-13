import 'package:flutter/cupertino.dart';
import 'dart:io';
class DocumentDetails {
 final File? id_document;
  final File? school_id;
  final File? student_transcript;
  final File? admission_letter;
 final File? fee_structure;
  final File? death_certificate_father;
  final File? death_certificate_mother;

 // Backend URLs (used when fetching)
 String? idDocumentUrl;
 String? schoolIdUrl;
 String? studentTranscriptUrl;
 String? admissionLetterUrl;
 String? feeStructureUrl;
 String? deathCertificateFather;
 String? deathCerificateMother;

 DocumentDetails({this.id_document,this.school_id,this.student_transcript,this.admission_letter,
  this.fee_structure,this.death_certificate_father,this.death_certificate_mother, this.idDocumentUrl,this.schoolIdUrl,this.studentTranscriptUrl,
 this.admissionLetterUrl,this.feeStructureUrl,this.deathCertificateFather,this.deathCerificateMother});
static const String baseUrl = "http://10.33.27.1:8000/";

  // Map<String,dynamic> toJson(){
  //   return{
  //     "id_document":id_document,
  //     "school_id":school_id,
  //     "student_transcript":student_transcript,
  //     "admission_letter":admission_letter,
  //     "fee_structure":fee_structure,
  //     "approval_letter":approval_letter
  //   };
  // }
factory DocumentDetails.fromJson(Map<String,dynamic>json){
  return DocumentDetails(
    idDocumentUrl: json['id_document'] != null ? baseUrl + json['id_document'] : null,
    schoolIdUrl: json['school_id'] != null ? baseUrl + json['school_id'] : null,
    studentTranscriptUrl: json['student_transcript'] != null ? baseUrl + json['student_transcript'] : null,
    admissionLetterUrl: json['admission_letter'] != null ? baseUrl + json['admission_letter'] : null,
    feeStructureUrl: json['fee_structure'] != null ? baseUrl + json['fee_structure'] : null,
    deathCertificateFather: json['death_certificate_father'] != null ? baseUrl + json['death_certificate_father'] : null,
    deathCerificateMother: json['death_certificate_mother'] != null ? baseUrl +json['death_certificate_mother'] : null,
  );
}
}
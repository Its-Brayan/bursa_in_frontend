import 'package:flutter/cupertino.dart';
import 'dart:io';
class DocumentDetails {
 final File? id_document;
  final File? school_id;
  final File? student_transcript;
  final File? admission_letter;
 final File? fee_structure;
  final File? approval_letter;

  DocumentDetails({this.id_document,this.school_id,this.student_transcript,this.admission_letter,
  this.fee_structure,this.approval_letter});

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
}
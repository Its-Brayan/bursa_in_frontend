import 'package:flutter/cupertino.dart';

class Documentdetails {
  FileImage? id_document;
  FileImage? school_id;
  FileImage? student_transcript;
  FileImage? admission_letter;
  FileImage? fee_structure;
  FileImage? approval_letter;

  Documentdetails({this.id_document,this.school_id,this.student_transcript,this.admission_letter,
  this.fee_structure,this.approval_letter});

  Map<String,dynamic> toJson(){
    return{
      "id_document":id_document,
      "school_id":school_id,
      "student_transcript":student_transcript,
      "admission_letter":admission_letter,
      "fee_structure":fee_structure,
      "approval_letter":approval_letter
    };
  }
}
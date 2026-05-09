import 'dart:io';
class DocumentDetails {
 final File? id_document;
  final File? school_id;
  final File? voters_card;
  final File? student_transcript;
  final File? admission_letter;
 final File? fee_structure;
  final File? death_certificate_father;
  final File? death_certificate_mother;
  final File? verify_applicant_disability;
  final File? verify_parent_or_guardian_disability;

 // Backend URLs (used when fetching)
 String? idDocumentUrl;
 String? schoolIdUrl;
 String? votersCardUrl;
 String? studentTranscriptUrl;
 String? admissionLetterUrl;
 String? feeStructureUrl;
 String? deathCertificateFatherUrl;
 String? deathCertificateMotherUrl;
 String? verifyApplicantDisabilityUrl;
 String? verifyParentOrGuardianDisabilityUrl;

 DocumentDetails({this.id_document,this.school_id,this.voters_card,this.student_transcript,this.admission_letter,
  this.fee_structure,this.death_certificate_father,this.death_certificate_mother,this.verify_applicant_disability,this.verify_parent_or_guardian_disability,this.idDocumentUrl,this.schoolIdUrl,this.votersCardUrl,this.studentTranscriptUrl,
 this.admissionLetterUrl,this.feeStructureUrl,this.deathCertificateFatherUrl,this.deathCertificateMotherUrl,this.verifyApplicantDisabilityUrl,this.verifyParentOrGuardianDisabilityUrl});
static const String baseUrl = "https://bursa-in-backend.onrender.com/";

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
factory DocumentDetails.fromJson(Map<String, dynamic> json) {
  String? parseUrl(dynamic value) {
    if (value == null) return null;

    final url = value.toString();

    // If already full URL (Cloudinary etc.)
    if (url.startsWith('http')) {
      return url;
    }

    // Otherwise prepend backend URL
    return baseUrl + url;
  }

  return DocumentDetails(
    idDocumentUrl: parseUrl(json['id_document']),
    schoolIdUrl: parseUrl(json['school_id']),
    votersCardUrl: parseUrl(json['voters_card']),
    studentTranscriptUrl: parseUrl(json['student_transcript']),
    admissionLetterUrl: parseUrl(json['admission_letter']),
    feeStructureUrl: parseUrl(json['fee_structure']),
    deathCertificateFatherUrl: parseUrl(json['death_certificate_father']),
    deathCertificateMotherUrl: parseUrl(json['death_certificate_mother']),
    verifyApplicantDisabilityUrl: parseUrl(json['verify_applicant_disability']),
    verifyParentOrGuardianDisabilityUrl: parseUrl(json['verify_parent_or_guardian_disability'])
  );
}
}
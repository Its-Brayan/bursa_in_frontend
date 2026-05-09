class PersonalDetails{
  String? full_name;
  String? registration_number;
  String? national_id_number;
  String? course_of_study;
  String? student_gender;
  String? Disability;
  String? disability_details;
  String? received_bursary;
  String? received_bursary_details;
  String? county;
  String? constituency;
  String? ward;
  PersonalDetails({this.full_name,this.registration_number,this.national_id_number,this.course_of_study,this.student_gender,this.Disability,this.disability_details,this.received_bursary,this.received_bursary_details,this.county,this.constituency,this.ward});

  Map<String,dynamic> toJson(){
    return {
      "full_name":full_name,
      "registration_number":registration_number,
      "national_id_number":national_id_number,
      "course_of_study":course_of_study,
      "student_gender":student_gender,
      "Disability":Disability,
      "disability_details":disability_details,
      "received_bursary":received_bursary,
      "received_bursary_details":received_bursary_details,
      "county":county,
      "constituency":constituency,
      "ward":ward
    };
  }
  factory PersonalDetails.fromJson(Map<String,dynamic>json){
    return PersonalDetails(
      full_name: json['full_name'],
      registration_number: json['registration_number'],
      national_id_number: json['national_id_number'],
      course_of_study: json['course_of_study'],
      student_gender: json['student_gender'],
      Disability: json['Disability'] == true ? "Yes" : "No",
      disability_details: json['disability_details'],
      received_bursary: json['received_bursary']  == true ? "Yes" : "No",
      received_bursary_details: json['received_bursary_details'],
      county: json['county'],
      constituency: json['constituency'],
      ward: json['ward']
    );
  }
}
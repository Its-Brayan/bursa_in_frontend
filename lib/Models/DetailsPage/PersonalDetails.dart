class PersonalDetails{
  String? full_name;
  String? registration_number;
  String? national_id_number;
  String? course_of_study;
  String? student_gender;
  String? county;
  String? constituency;
  String? ward;
  PersonalDetails({this.full_name,this.registration_number,this.national_id_number,this.course_of_study,this.student_gender,this.county,this.constituency,this.ward});

  Map<String,dynamic> toJson(){
    return {
      "full_name":full_name,
      "registration_number":registration_number,
      "national_id_number":national_id_number,
      "course_of_study":course_of_study,
      "student_gender":student_gender,
      "county":county,
      "constituency":constituency,
      "ward":ward
    };
  }
}
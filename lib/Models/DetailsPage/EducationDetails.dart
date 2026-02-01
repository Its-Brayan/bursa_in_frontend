class EducationDetails {
  String? name_of_institution;
  String? course_level;
  String? year_of_study;
  String? year_of_completion;
  String? institution_postal_address;
  String? institution_tel_number;

  EducationDetails({
    this.name_of_institution,
    this.course_level,
    this.year_of_study,
    this.year_of_completion,
    this.institution_postal_address,
    this.institution_tel_number,
  });

  Map<String, dynamic> toJson() {
    return {
      "name_of_institution": name_of_institution,
      "course_level": course_level,
      "year_of_study": year_of_study,
      "year_of_completion": year_of_completion,
      "institution_postal_address": institution_postal_address,
      "institution_tel_number": institution_tel_number,
    };
  }
  factory EducationDetails.fromJson(Map<String,dynamic>json){
    return EducationDetails(
      name_of_institution: json['name_of_institution'],
      course_level: json['course_level'],
      year_of_study: json['year_of_study'],
      year_of_completion: json['year_of_completion'],
      institution_postal_address: json['institution_postal_address'],
      institution_tel_number: json['institution_tel_number']
    );
  }
}

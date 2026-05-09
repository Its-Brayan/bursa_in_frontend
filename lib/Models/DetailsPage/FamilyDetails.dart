class FamilyDetails {
  String? fathers_name;
  String? fathers_occupation;
  String? mothers_name;
  String? mothers_occupation;
  String? parents_alive;
  String? guardian_name;
  String? guardian_occupation;
  String? chronic_illness;
  String? chronic_illness_details;
  String? parent_or_guardian_disability;
  String? parent_or_guardian_disability_details;
  String? parent_or_guardian_chronic_illness;
  String? parent_or_guardian_chronic_illness_details;
  String? paying_fees;
  String? number_of_siblings;
  String? number_of_siblings_working;
  String? number_of_siblings_in_business;
  String? number_of_siblings_in_college;
  String? number_of_siblings_in_highschool;
  String? annual_family_income;
  String? estimated_annual_family_expenses;
  String? source_of_income;
  String? other_income_sources;
  String? amount_spent_on_fees;

  FamilyDetails({this.fathers_name,this.fathers_occupation,this.mothers_name,this.mothers_occupation,this.parents_alive,this.guardian_name,this.guardian_occupation,this.chronic_illness,this.chronic_illness_details,this.parent_or_guardian_disability,this.parent_or_guardian_disability_details,this.parent_or_guardian_chronic_illness,this.parent_or_guardian_chronic_illness_details,this.paying_fees, this.number_of_siblings,
  this.number_of_siblings_working,this.number_of_siblings_in_business,this.number_of_siblings_in_college,
  this.number_of_siblings_in_highschool,this.annual_family_income,this.estimated_annual_family_expenses,this.source_of_income,this.other_income_sources,this.amount_spent_on_fees});

  Map<String,dynamic> toJson(){
     return {
      'fathers_name': fathers_name,
      'fathers_occupation':fathers_occupation,
      'mothers_name':mothers_name,
      'mothers_occupation':mothers_occupation,
      'parents_alive':parents_alive,
      'guardian_name':guardian_name,
      'guardian_occupation':guardian_occupation,
      'chronic_illness':chronic_illness,
      'chronic_illness_details':chronic_illness_details,
      'parent_or_guardian_disability':parent_or_guardian_disability,
      'parent_or_guardian_disability_details':parent_or_guardian_disability_details,
      'parent_or_guardian_chronic_illness':parent_or_guardian_chronic_illness,
      'parent_or_guardian_chronic_illness_details':parent_or_guardian_chronic_illness_details,
     'paying_fees':paying_fees,
      'number_of_siblings':number_of_siblings,
      'number_of_siblings_working':number_of_siblings_working,
      'number_of_siblings_in_business': number_of_siblings_in_business,
      'number_of_siblings_in_college':number_of_siblings_in_college,
      'number_of_siblings_in_highschool':number_of_siblings_in_highschool,
     'annual_family_income': annual_family_income,
     'estimated_annual_family_expenses':estimated_annual_family_expenses,
     'source_of_income':source_of_income,
     'other_income_sources':other_income_sources,
     'amount_spent_on_fees':amount_spent_on_fees
  };
  }
  factory FamilyDetails.fromJson(Map<dynamic,dynamic>json){
    return FamilyDetails(
      fathers_name: json['fathers_name'],
      fathers_occupation: json['fathers_occupation'],
      mothers_name: json['mothers_name'],
      mothers_occupation: json['mothers_occupation'],
      parents_alive: json['parents_alive'],
      guardian_name:json['guardian_name'],
      guardian_occupation:json['guardian_occupation'],
      chronic_illness:json['chronic_illness'] == true ? "Yes" : "No",
      chronic_illness_details:json['chronic_illness_details'],
      parent_or_guardian_disability:json['parent_or_guardian_disability'] == true ? "Yes" : "No",
      parent_or_guardian_disability_details:json['parent_or_guardian_disability_details'],
      parent_or_guardian_chronic_illness:json['parent_or_guardian_chronic_illness'] == true ? "Yes" : "No",
      parent_or_guardian_chronic_illness_details:json['parent_or_guardian_chronic_illness_details'],
      paying_fees: json['paying_fees'],
      number_of_siblings: json['number_of_siblings'].toString(),
      number_of_siblings_working: json['number_of_siblings_working'].toString(),
      number_of_siblings_in_business: json['number_of_siblings_working'].toString(),
      number_of_siblings_in_college: json['number_of_siblings_in_college'].toString(),
      number_of_siblings_in_highschool: json['number_of_siblings_in_highschool'].toString(),
      annual_family_income: json['annual_family_income'].toString(),
      estimated_annual_family_expenses: json['estimated_annual_family_expenses'],
      source_of_income: json['source_of_income'],
      other_income_sources: json['other_income_sources'],
      amount_spent_on_fees: json['amount_spent_on_fees'].toString(),
    );
  }
}
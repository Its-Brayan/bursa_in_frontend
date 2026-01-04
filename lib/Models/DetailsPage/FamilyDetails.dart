class FamilyDetails {
  String? fathers_name;
  String? fathers_occupation;
  String? mothers_name;
  String? mothers_occupation;
  String? parents_alive;
  String? paying_fees;
  String? number_of_siblings;
  String? number_of_siblings_working;
  String? number_of_siblings_in_business;
  String? number_of_siblings_in_college;
  String? number_of_siblings_in_highschool;
  String? annual_family_income;
  String? source_of_income;
  String? other_income_sources;
  String? amount_spent_on_fees;

  FamilyDetails({this.fathers_name,this.fathers_occupation,this.mothers_name,this.mothers_occupation,this.parents_alive,this.paying_fees, this.number_of_siblings,
  this.number_of_siblings_working,this.number_of_siblings_in_business,this.number_of_siblings_in_college,
  this.number_of_siblings_in_highschool,this.annual_family_income,this.source_of_income,this.other_income_sources,this.amount_spent_on_fees});

  Map<String,dynamic> toJson(){
     return {
      'fathers_name': fathers_name,
      'fathers_occupation':fathers_occupation,
      'mothers_name':mothers_name,
      'mothers_occupation':mothers_occupation,
      'parents_alive':parents_alive,
     'paying_fees':paying_fees,
      'number_of_siblings':number_of_siblings,
      'number_of_siblings_working':number_of_siblings_working,
      'number_of_siblings_in_business': number_of_siblings_in_business,
      'number_of_siblings_in_college':number_of_siblings_in_college,
      'number_of_siblings_in_highschool':number_of_siblings_in_highschool,
     'annual_family_income': annual_family_income,
     'source_of_income':source_of_income,
     'other_income_sources':other_income_sources,
     'amount_spent_on_fees':amount_spent_on_fees
  };
  }
}
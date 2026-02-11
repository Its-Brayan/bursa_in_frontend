class BursaryDetail{
final int? id;
String? bursary_name;
String? bursary_amount;
String? level_of_study;
String? bursary_deadline;
bool isFavorite;

BursaryDetail({this.id,this.bursary_name,this.bursary_amount,this.bursary_deadline,this.level_of_study,this.isFavorite = false});

Map<String,dynamic> toJson(){
  return{
    "id":id,
    "title":bursary_name,
    "amount":bursary_amount,
    "level_of_study":level_of_study,
    "application_deadline":bursary_deadline
  };
}
factory BursaryDetail.fromJson(Map<String,dynamic>json){
  return BursaryDetail(
  id: json['id'],
  bursary_name : json['title'],
  bursary_amount : json['amount'],
  level_of_study: json['level_of_study'],
  bursary_deadline: json['application_deadline'],
    isFavorite: json['is_favorite'] ?? false
  );
}
}

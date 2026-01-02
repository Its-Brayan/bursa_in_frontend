class UserModel {
  String? full_name;
  String? email;
  String? phone_number;
  String? password;
  String? confirm_password;

  UserModel({this.full_name,this.email,this.phone_number,this.password,this.confirm_password});
  Map<String,dynamic> toJson(){
    return{
      "full_name":full_name,
      "email":email,
      "phone_number":phone_number,
      "password":password,
      "confirm_password":confirm_password,
    };
  }
  Map<String,dynamic> toLoginJson(){
    return{
      "email":email,
      "password":password,
    };
  }
}
import 'package:bursary_inn/Models/DetailsPage/DocumentDetails.dart';
import 'package:bursary_inn/Models/DetailsPage/EducationDetails.dart';
import 'package:bursary_inn/Models/DetailsPage/FamilyDetails.dart';
import 'package:bursary_inn/Models/DetailsPage/PersonalDetails.dart';
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Services/BursaryService/FavoriteService.dart';
import 'package:bursary_inn/Services/BursaryService/FetchAppliedBursaries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bursary_inn/Services/UserService.dart';
import 'package:bursary_inn/Models/UserModel.dart';
import 'package:bursary_inn/Services/DetailsServices/PersonalDetailsService.dart';
import 'package:bursary_inn/Services/DetailsServices/FamilyDetailsService.dart';
import 'package:bursary_inn/Services/DetailsServices/EducationDetailsService.dart';
import 'package:bursary_inn/Services/DetailsServices/DocumentDetailsService.dart';
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:bursary_inn/Services/BursaryService/AllAvailableService.dart';

class UserProvider with ChangeNotifier{
  final UserService _userService = UserService();
  String? _phoneError;
  String? _emailError;
  String? _errorMessage;
  String? get emailError => _emailError;
  String? get errorMessage => _errorMessage;
  String? get phoneError => _phoneError;

  Future<bool> create_student(UserModel user) async{

    _phoneError = null;
    _emailError = null;
    notifyListeners();
    try {
      final success = await _userService.register_user(user);
      final Map<String, dynamic> responsedata = success;
      if (responsedata['success'] == true) {
        print(responsedata['data']);
        notifyListeners();
        return true;
      } else {
       final _error = responsedata['error'];
       // if(_error is Map && _error.isNotEmpty) {
       // final messages = _error.entries.map((entries){
       //   final value = entries.value;
       //   if(value is List && value.isNotEmpty){
       //     return value.first.toString();
       //   }else{
       //     return value.toString();
       //   }
       // }).join('\n');
       // _errorMessage = messages;
       if(_error is Map && _error.containsKey('email')){
         _emailError = _error['email'][0].toString();
       }
       if(_error is Map && _error.containsKey('phone_number')){

         _phoneError = _error['phone_number'][0].toString();
       }
      }
      notifyListeners();
      return false;
    }
      catch(e){
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
  void clear_errors(){
    _phoneError = null;
    _emailError = null;
    notifyListeners();
}
  Future<bool> login_student(UserModel user) async{
    _errorMessage = null;
    final success = await _userService.login_user(user);
    final Map<String,dynamic> responsedata = success;
    try{
      if(responsedata['success']==true) {
        print(responsedata['data']);
        notifyListeners();
        return true;
      }
      else{
        final _error = responsedata['error'];
        _errorMessage = _error['detail'];
        notifyListeners();
        return false;
      }
    }catch(e){
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
  Future<void> logout_user()async{
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
    print("User logged out successfully");
    notifyListeners();
  }

}

class DetailsPageProvider with ChangeNotifier{
  Map<String,bool> _filled_sections = {
    "personal_filled":false,
    "family_filled":false,
    "education_filled":false,
    "documents_filled":false,
  };
  PersonalDetails? _current_personal_details;
  PersonalDetails? get current_personal_details => _current_personal_details;
  EducationDetails? _current_education_details;
  EducationDetails? get current_education_details => _current_education_details;
  FamilyDetails? _current_family_details;
  FamilyDetails? get current_family_details => _current_family_details;
  DocumentDetails? _current_document_details;
  DocumentDetails? get current_document_details => _current_document_details;
   Map<String,bool> get filled_sections => _filled_sections;
String? _errorMessage;
String? get errorMessage => _errorMessage;
bool? _filled;
bool? get filled => _filled;
Future<bool> create_personal_details(PersonalDetails person) async{
  _errorMessage = null;
  notifyListeners();
  try {
    final success = await Personaldetailsservice().create_personal_details(person);
    final Map<String,dynamic>responsedata = success;
    if(responsedata['success']==true){
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      final error = responsedata['error'];
      _errorMessage = error['national_id_number'][0];
      print(error);
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    notifyListeners();
    return false;
  }
}

  void clear_error_message(){
    _errorMessage = null;
    notifyListeners();
  }
Future<bool> create_education_details(EducationDetails education) async{
  _errorMessage = null;
  notifyListeners();
  try{
    final success = await Educationdetailsservice().create_education_details(education);
    final Map<String,dynamic> responsedata = success;
    if(responsedata['success'] == true){
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      final error = responsedata['error'];
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    notifyListeners();
    return false;
  }
}
Future<bool> create_family_details(FamilyDetails family) async{
  _errorMessage = null;
  notifyListeners();
  try{
    final success = await Familydetailsservice().create_family_details(family);
    final Map<String,dynamic> responsedata=success;
    if(responsedata['success']==true){
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      final error = responsedata['error'];
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    notifyListeners();
    return false;
  }
}
Future<bool> create_documents_details(DocumentDetails documents) async{
  _errorMessage = null;
  try{
    final success = await Documentdetailsservice().create_document_details(documents);
    final Map<String,dynamic> responsedata = success;
    if(responsedata['success']==true){
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      final error = responsedata['error'];
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    notifyListeners();
    return false;
  }
}
Future<void> check_completed_student_detail(BuildContext context) async{
  try{
  final status = await UserService().get_student_completion_status();
  _filled_sections = {
    "personal_filled":status['personal_filled'] ?? false,
    "education_filled":status['education_filled'] ?? false,
    "family_filled":status['family_filled'] ?? false,
    "documents_filled":status['documents_uploaded']  ?? false,
  };
  notifyListeners();
  }catch(e){
    _filled = false;
    notifyListeners();
    print(e);
  }
}
Future<void> get_student_personal_details()async{
  try {
    _current_personal_details =
    await Personaldetailsservice().fetch_personal_details();
    print("Successfully fetched personal details");
    notifyListeners();
  }catch(e){
    print("Failed to fetch personal details ${e}");
  }
}
Future<void> get_student_education_details()async{
  try{
    _current_education_details = await Educationdetailsservice().get_education_details();
    notifyListeners();
  }catch(e){
    print("Failed to fetch education details ${e}");
  }
}
Future<void> get_student_family_details()async{
  try{
    _current_family_details = await Familydetailsservice().get_family_details();
    notifyListeners();
  }catch(e){
    print("Failed to fetch family details ${e}");
  }
}
Future<void> get_student_document_uploads() async{
  try{
    _current_document_details = await Documentdetailsservice().fetch_document_uploads();
    notifyListeners();
  }catch(e){
    print("Failed to fetch family details $e");
  }
}
Future<bool> update_student_personal_details(PersonalDetails student) async{
  _errorMessage = null;
  try {
    final success = await Personaldetailsservice().update_personal_details(
        student);
    final Map<String, dynamic> responsedata = success;
    if (responsedata['success'] == true) {
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    print(_errorMessage);
    return false;
  }
}
Future<bool> update_family_details(FamilyDetails family) async {
  _errorMessage = null;
  try {
    final success = await Familydetailsservice().update_family_details(family);
    final Map<String, dynamic> responsedata = success;
    if (responsedata['success'] == true) {
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    print(errorMessage);
    notifyListeners();
    return false;
  }
}
Future<bool> update_education_details(EducationDetails education)async{
  _errorMessage = null;
  try{
    final success = await Educationdetailsservice().update_education_details(education);
    final Map<String,dynamic> responsedata = success;
    if(responsedata['success'] == true){
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    print(_errorMessage);
    return false;
  }
}
Future<bool> update_document_details(DocumentDetails document) async{
  _errorMessage =null;
  try{
    final success = await Documentdetailsservice().update_document_details(document);
    final Map<String,dynamic> responsedata = success;
    if(responsedata['success']){
      print(responsedata['data']);
      notifyListeners();
      return true;
    }else{
      print(responsedata['error']);
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    notifyListeners();
    print(_errorMessage);
    return false;
  }
}
}
class BursaryProvider with ChangeNotifier{
  List<BursaryDetail> _all_bursaries = [];
  List<dynamic> _applied_bursaries = [];
  List<BursaryDetail> get all_bursaries => _all_bursaries;
  List<dynamic> get applied_bursaries => _applied_bursaries;
  Future<List<BursaryDetail>> get_all_bursaries() async{
    _all_bursaries = await AllavailableService().get_all_bursaries();
    notifyListeners();
    return _all_bursaries;
  }
  List<dynamic> _favourite_bursaries = [];
  List<dynamic> get favorite_bursaries => _favourite_bursaries;
  Future<List<dynamic>> get_applied_bursaries() async{
    _applied_bursaries = await FetchAppliedBursaries().fetch_applied_bursaries();
    notifyListeners();
    return _applied_bursaries;
  }
  Future<List<dynamic>> get_favorite_bursaries()async{
   _favourite_bursaries = await Favoriteservice().fetch_favorite_bursaries();
   notifyListeners();
   return _favourite_bursaries;
  }
}
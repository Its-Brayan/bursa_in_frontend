import 'package:bursary_inn/Models/DetailsPage/DocumentDetails.dart';
import 'package:bursary_inn/Models/DetailsPage/EducationDetails.dart';
import 'package:bursary_inn/Models/DetailsPage/FamilyDetails.dart';
import 'package:bursary_inn/Models/DetailsPage/PersonalDetails.dart';
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
  String? _errorMessage;
  String? _emailError;

  String? get emailError => _emailError;
  String? get errorMessage => _errorMessage;

  Future<bool> create_student(UserModel user) async{
    _errorMessage = null;
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
       final error = responsedata['error'];
       notifyListeners();
       return false;
      }
    }
      catch(e){
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
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
  Future<void> logout_user()async{
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
    print("User logged out successfully");
    notifyListeners();
  }

}

class DetailsPageProvider with ChangeNotifier{
String? _errorMessage;
String? get errorMessage => _errorMessage;

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
      notifyListeners();
      return false;
    }
  }catch(e){
    _errorMessage = e.toString();
    notifyListeners();
    return false;
  }

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
  Future<List<dynamic>> get_applied_bursaries() async{
    _applied_bursaries = await FetchAppliedBursaries().fetch_applied_bursaries();
    notifyListeners();
    return _applied_bursaries;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:bursary_inn/Services/UserService.dart';
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:bursary_inn/Models/UserModel.dart';

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
    final _storage = FlutterSecureStorage();
    await _storage.deleteAll();
    notifyListeners();
  }

}
import 'package:flutter/foundation.dart';
import 'package:responsivedashboard/User/resources/api_client.dart';
import 'package:responsivedashboard/User/resources/user_validators.dart';

class UserBloc with ChangeNotifier {
  final UserValidator _userValidator = UserValidator();
  final UserApiClient _userApiClient = UserApiClient();

  /*
   *  API functions 
   */

  Future<bool> login(String username, String password) async {
    if (!isValidUsername(username) || !isValidPassword(password)) {
      return false;
    }
    return await _userApiClient.login(username, password);
  }

  Future<bool> signup(String username, String email, String password) async {
    if (!isValidUsername(username) ||
        !isValidEmail(email) ||
        !isValidPassword(password)) {
      return false;
    }

    return await _userApiClient.signup(username, email, password);
  }

  Future<bool> logout() async {
    return await _userApiClient.logout();
  }

  Future<bool> isLoggedIn() async {
    return await _userApiClient.isLoggedIn();
  }

  /*
   *  Validation functions 
   */

  bool isValidEmail(String email) {
    return _userValidator.isValidEmail(email);
  }

  bool isValidUsername(String username) {
    bool valid = _userValidator.isValidUsername(username);
    return valid;
  }

  bool isValidPassword(String password) {
    return _userValidator.isValidPassword(password);
  }
}

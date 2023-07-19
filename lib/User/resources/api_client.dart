import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserApiClient {
  final String _baseUrl = dotenv.env['API_URL'].toString();
  bool _isLoggedIn = false;

  get isLoggedIn => _isLoggedIn;

  // User login
  Future<bool> login(String username, String password) async {
    //do a post request to the login endpoint

    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
    };

    Uri uri = Uri.parse('$_baseUrl/user/login/');

    try {
      Response response = await post(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody));

      // Check the response status code
      if (response.statusCode == 200) {
        // Login successful, handle the response data
        Map<String, dynamic> responseData = jsonDecode(response.body);
        _isLoggedIn = true;
        print('Login Successful: ${responseData['message']}');
        return true;
      } else {
        // Login failed, handle the error response
        print('Login Failed: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // User signup
  Future<bool> signup(String username, String email, String password) async {
    Map<String, dynamic> requestBody = {
      'username': username,
      'email': email,
      'password': password,
    };

    Uri uri = Uri.parse('$_baseUrl/user/new/');

    try {
      Response response = await post(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody));

      // Check the response status code
      if (response.statusCode == 201) {
        // Signup successful, handle the response data
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Signup Successful: ${responseData['message']}');
        return true;
      } else {
        // Signup failed, handle the error response
        print('Signup Failed: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout() async {
    return false;
  }
}

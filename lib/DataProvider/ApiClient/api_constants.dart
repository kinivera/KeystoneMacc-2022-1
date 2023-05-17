import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiConstants{
  static const String baseUrl = "https://maticas.org";

  const ApiConstants();

  /*
      ENDPOINTS
   */

  static const logIn  = "/user/login";
  static const signIn = "/user/new";
  static const newOrg = "/orgs/new";
}

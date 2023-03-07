/*
 *
 *              OTHER UTILS
 *
 */

bool isPasswordValid(String password) => password.length >= 8;

bool isUserValid(String user) => (user.length >= 4) && (user.length <= 60);

bool isEmailValid(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

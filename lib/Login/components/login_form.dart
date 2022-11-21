import 'dart:html';

import 'package:flutter/material.dart';
import 'package:responsivedashboard/util/Button.dart';
import '../../api-client/api_client.dart';
import '../../util/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _pswdController = new TextEditingController();

  ApiService api = ApiService();

late Future<AuthCheck> _checkingAuth;

  @override
  Widget build(BuildContext context) {
   
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _userController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (user){debugPrint(user);},
            onSaved: (user) {debugPrint(user);},
            decoration: InputDecoration(
              hintText: "Your username",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
        
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _pswdController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onSaved: (pswd){},
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
    
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {  
              final String user = _userController.text.trim();
              final String pswd = _pswdController.text.trim();
                if(user.isEmpty){
                  debugPrint('user is empty');
                }else{
                  if(pswd.isEmpty || pswd.length<8){
                      debugPrint('password is empty');
                  }else{
                    api.authUserbyUsername(user, pswd);
                    Navigator.of(context).pushNamed('/home');
                  }
                }
              },
              child: Text(
                "L O G I N",
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}





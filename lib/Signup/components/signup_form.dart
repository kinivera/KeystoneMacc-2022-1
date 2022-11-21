import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../api-client/api_client.dart';
import '../../util/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _pswdController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  ApiService api = ApiService();

late Future<AuthCheck> _checkingAuth;
   

  @override
  
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.attach_email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _userController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (user){},
              decoration: InputDecoration(
                hintText: "Your username",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
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
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              final String email = _emailController.text.trim();
              final String user = _userController.text.trim();
              final String pswd = _pswdController.text.trim();

              if(email.isEmpty || !email.contains('@') ){
                debugPrint('email is empty');
              }else{
                if(user.isEmpty){
                  debugPrint('user is empty');
                }else{
                  if(pswd.isEmpty || pswd.length<8){
                      debugPrint('password is empty');
                  }else{
                    api.addUser(user, email, pswd);
                    Navigator.of(context).pushNamed('/Login');
                  }
                }
              }
            },
            child: Text("S I G N  U P"),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
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

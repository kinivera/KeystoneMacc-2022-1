import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api-client/api-client.dart';
import '../../util/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _pswdController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final formGlobalKey = GlobalKey <FormState> ();


  @override
  
  Widget build(BuildContext context) {
    AppApiClient client =  Provider.of<AppApiClient>(context);

    return Form(
      key: formGlobalKey,
      child: Column(
        children: [

          // Email Input Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            validator: (email){
              if (isEmailValid(email!)){
                return null;
              }else{
                return 'Invalid Email';
              }
            },
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.attach_email),
              ),
            ),
          ),

          // Username Input Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _userController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (user){},
              validator: (user){
                if (isUserValid(user!)){
                  return null;
                }else{
                  return 'Valid usernames have between 4 and 60 characters.';
                }
              },
              decoration: InputDecoration(
                hintText: "Your username",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),

          // Password Input Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _pswdController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onSaved: (pswd){},
              validator: (pswd){
                if (isPasswordValid(pswd!)){
                  return null;
                }else{
                  return 'Password should be at least 8 characters long.';
                }
              },
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

          // INPUT VALIDATION FIELD
          ElevatedButton(
              child: Text("S I G N  U P"),
              onPressed: ()async {
                      final String email = _emailController.text.trim();
                      final String user = _userController.text.trim();
                      final String pswd = _pswdController.text.trim();

                      if (formGlobalKey.currentState!.validate()){
                        debugPrint("Valid User Input Data");

                        //authenticates with client
                        await client.signIn(user, email, pswd);

                        if (client.signedIn){
                          //stores the credentials in the phone ...
                          Navigator.of(context).pushNamed('/Login');
                        }else{
                          print("NOT SIGNED IN");
                        }

                      }
                  }
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

import 'package:flutter/material.dart';
import '../../util/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

//API
import 'package:provider/provider.dart';
import '../../userDataProvider/api-client/api-client.dart';

//https://www.topcoder.com/thrive/articles/form-validation-in-flutter


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _pswdController = TextEditingController();
  final formGlobalKey = GlobalKey <FormState> ();


  @override
  Widget build(BuildContext context) {
    AppApiClient client =  Provider.of<AppApiClient>(context);

    return Form(
      key: formGlobalKey,
      child: Column(
        children: [

          //username input field
          TextFormField(
            controller: _userController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (user){debugPrint(user);},
            onSaved: (user) {debugPrint(user);},
            validator: (user){
              if (isUserValid(user!)) return null;
              else return 'User names should be between 4 and 60 characters.';
            },
            decoration: InputDecoration(
              hintText: "Your username",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),

          //password input field
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
                } else{
                  return 'Passwords should have more than 7 characters.';
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

          const SizedBox(height: defaultPadding),

          //submission field button
          ElevatedButton(
              onPressed: () async{
              final String user = _userController.text.trim();
              final String pswd = _pswdController.text.trim();

              if (formGlobalKey.currentState!.validate()){
                debugPrint("Valid User Input Data");

                //authenticates with client
                await client.authUser(user, pswd);

                if (client.loggedIn){
                  //stores the credentials in the phone ...
                  Navigator.of(context).pushNamed('/home');
                }else{
                  print("NOT LOGGED IN");
                }

              }

            },
              child: Text("L O G I N"),),

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




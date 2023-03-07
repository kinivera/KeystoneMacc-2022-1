import 'package:flutter/material.dart';

import '/constants.dart';
import '/Views/Login/login_screen.dart';
import '/Utils/input_validation.dart';
import '/Widgets/already_have_an_account_acheck.dart';

//API
import 'package:provider/provider.dart';
import '/DataProvider/data_provider.dart';
import '/DataProvider/ApiClient/api_client.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final formGlobalKey = GlobalKey <FormState> ();


  @override
  
  Widget build(BuildContext context) {
    //gets the APIClient instance from the data provider
    AppApiClient client =  Provider.of<DataProvider>(context).apiClient;

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
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
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
              decoration: const InputDecoration(
                hintText: "Your username",
                prefixIcon:  Padding(
                  padding:  EdgeInsets.all(defaultPadding),
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
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon:  Padding(
                  padding:  EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),

          // INPUT VALIDATION FIELD
          ElevatedButton(
              child: const Text("S I G N  U P"),
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
                          debugPrint("NOT SIGNED IN");
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
                    return const LoginScreen();
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

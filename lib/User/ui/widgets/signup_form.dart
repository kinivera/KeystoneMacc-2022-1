import 'package:flutter/material.dart';

import 'package:responsivedashboard/User/ui/screens/login_screen.dart';
import 'package:responsivedashboard/User/ui/widgets/already_have_an_account_acheck.dart';

//API
import 'package:provider/provider.dart';
import 'package:responsivedashboard/utils/constants.dart';
import 'package:responsivedashboard/User/bloc/bloc_user.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //gets the APIClient instance from the data provider
    UserBloc userBloc = Provider.of<UserBloc>(context);

    return Form(
        key: formGlobalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Input Field
            Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (email) {},
                  validator: (email) {
                    if (userBloc.isValidEmail(email!)) {
                      return null;
                    } else {
                      return 'Invalid Email. Should be between 5 and 60 characters long, should not contain spaces nor special characters.';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Your email",
                    errorMaxLines: 4,
                    helperMaxLines: 4,
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
                    onSaved: (user) {},
                    validator: (user) {
                      if (userBloc.isValidUsername(user!)) {
                        return null;
                      } else {
                        return 'Valid User names should be between 8 and 60 characters, should not contain special characters and should not contain spaces';
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Your username",
                      errorMaxLines: 4,
                      helperMaxLines: 4,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
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
                    onSaved: (pswd) {},
                    validator: (pswd) {
                      if (userBloc.isValidPassword(pswd!)) {
                        return null;
                      } else {
                        return 'Password should be between 8 and 60 characters, should not contain spaces and cannot be a permutation of the username';
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Your password",
                      errorMaxLines: 4,
                      helperMaxLines: 4,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),

                // INPUT VALIDATION FIELD
                ElevatedButton(
                    child: const Text("S I G N  U P"),
                    onPressed: () async {
                      final String email = _emailController.text.trim();
                      final String user = _userController.text.trim();
                      final String pswd = _pswdController.text.trim();

                      if (formGlobalKey.currentState!.validate()) {
                        debugPrint("Valid User Input Data");

                        //authenticates with client
                        //await client.signIn(user, email, pswd);

                        if (true) {
                          //stores the credentials in the phone ...
                          //Navigator.of(context).pushNamed('/Login');
                        } else {
                          debugPrint("NOT SIGNED IN");
                        }
                      }
                    }),

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
          ],
        ));
  }
}

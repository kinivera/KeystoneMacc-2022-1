import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:responsivedashboard/utils/constants.dart';
import 'package:responsivedashboard/User/bloc/bloc_user.dart';
import 'package:responsivedashboard/User/ui/screens/signup_screen.dart';

//some states manager
import 'package:responsivedashboard/User/ui/widgets/already_have_an_account_acheck.dart';

//https://www.topcoder.com/thrive/articles/form-validation-in-flutter
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //gets the APIClient instance from the data provider
    //DataProvider dataProvider = Provider.of<DataProvider>(context);
    UserBloc userBloc = Provider.of<UserBloc>(context);

    return Form(
      key: formGlobalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //username input field
          TextFormField(
            controller: _userController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (user) {
              debugPrint(user);
            },
            onSaved: (user) {
              userBloc.setUsername(user!);
              debugPrint(user);
            },
            validator: (user) {
              if (userBloc.isValidUsername(user!)) {
                return null;
              } else {
                return 'User names should be between 8 and 60 characters, should not contain special characters and should not contain spaces.';
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

          //password input field
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
                  return 'Passwords should have more than 7 characters, should not be longer than 60 characters and does not contain the username.';
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

          const SizedBox(height: defaultPadding),

          //submission field button
          ElevatedButton(
            onPressed: () async {
              final String user = _userController.text.trim();
              final String pswd = _pswdController.text.trim();

              if (formGlobalKey.currentState!.validate()) {
                debugPrint("Valid User Input Data");

                //authenticates with client
                //await dataProvider.logIn(user, pswd);

                /*
                if (dataProvider.loggedIn) {
                  //initiates the state manager
                  await states.init(context);
                  //stores the credentials in the phone ...
                  Navigator.of(context).pushNamed('/home');
                } else {
                  debugPrint("NOT LOGGED IN");
                }
                */
              }
            },
            child: const Text("L O G I N"),
          ),

          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
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

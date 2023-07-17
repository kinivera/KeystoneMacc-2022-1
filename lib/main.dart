import 'package:flutter/material.dart';
import 'package:responsivedashboard/User/bloc/bloc_user.dart';

//Provider
import 'package:provider/provider.dart';

//Views
import 'package:responsivedashboard/User/ui/screens/login_screen.dart';
import 'package:responsivedashboard/User/ui/screens/signup_screen.dart';
import 'package:responsivedashboard/User/ui/screens/welcome_screen.dart';
import 'package:responsivedashboard/Maticas/ui/screens/general_about_screen.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  //await initHiveForFlutter();

  // use provider to make available the blocs to the entire app
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/Login': (context) => const LoginScreen(),
        '/Signup': (context) => const SignUpScreen(),
        '/about': (context) => const AboutScreen(),

        //
        //**** check 'indicatorStates.dart' and 'constants.dart '****
        //
        /*
        '/home': (context) => const ResponsiveLayout(
              mobileBody: HomeMenuMobile(),
              desktopBody: HomeMenuDesktop(),
            ),
        '/ex-rout': (context) => const ResponsiveLayout(
              mobileBody: ExampleRoutingMobile(),
              desktopBody: ExampleRoutingDesktop(),
            ),
        '/settings': (context) => const ResponsiveLayout(
              mobileBody: SettingsMobile(),
              desktopBody: SettingsDesktop(),
            ),
            */
      },
    );
  }
}

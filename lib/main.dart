import 'package:flutter/material.dart';
import 'Views/responsive_layout.dart';

import 'Views/Login/login_screen.dart';
import 'Views/Signup/signup_screen.dart';
import 'Views/Welcome/welcome_screen.dart';

// Mobile Views
import '/Views/Home/Mobile/home.dart';
import '/Views/About/Mobile/about.dart';
import '/Views/Settings/Mobile/settings.dart';
import '/Views/ExampleRouting/Mobile/example_routing.dart';

// Web Views
import 'Views/Home/Web/home.dart';
import 'Views/About/Web/about.dart';
import 'Views/Settings/Web/settings.dart';
import 'Views/ExampleRouting/Web/example_routing.dart';

//API packages
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsivedashboard/DataProvider/data_provider.dart';

//State Management
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';



void main() async{

  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DataProvider()),
    ChangeNotifierProvider(create: (_) => HomeAmbientVariableDashboard()),
  ],
      child: const MyApp(),),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (context) => const ResponsiveLayout(
          mobileBody: WelcomeScreen(),
          desktopBody: WelcomeScreen(),
        ),
        '/Login': (context) => const ResponsiveLayout(
          mobileBody: LoginScreen(),
          desktopBody: LoginScreen(),
        ),
        '/Signup': (context) => const ResponsiveLayout(
          mobileBody: SignUpScreen(),
          desktopBody: SignUpScreen(),
        ),
       /* '/': (context) => const ResponsiveLayout(
          mobileBody: HomeMenuMobile(),
          desktopBody: HomeMenuDesktop(),
        ),*/

        //
        //**** check 'indicatorStates.dart' and 'constants.dart '****
        //
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
        '/about': (context) => const ResponsiveLayout(
          mobileBody: AboutMobile(),
          desktopBody: AboutDesktop(),
        )
      },

    );
  }
}




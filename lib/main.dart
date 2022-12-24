import 'package:flutter/material.dart';
import 'package:responsivedashboard/userDataProvider/data_provider.dart';
import 'responsive/responsive_layout.dart';

import 'Views/Login/login_screen.dart';
import 'Views/Signup/signup_screen.dart';
import 'Views/Welcome/welcome_screen.dart';

// Mobile Views
import 'responsive/mobile/example_routing.dart';
import 'responsive/mobile/home.dart';
import 'package:responsivedashboard/responsive/mobile/settings.dart';
import 'package:responsivedashboard/responsive/mobile/about.dart';

// Web Views
import 'responsive/web/example_routing.dart';
import 'responsive/web/home.dart';
import 'package:responsivedashboard/responsive/web/settings.dart';
import 'package:responsivedashboard/responsive/web/about.dart';

//API
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsivedashboard/userDataProvider/api-client/api-client.dart';



void main() async{

  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  runApp(MultiProvider(providers: [
    //ChangeNotifierProvider(create: (_) => AppApiClient()),
    ChangeNotifierProvider(create: (_) => DataProvider()),
  ],
      child: MyApp(),),
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




import 'package:flutter/material.dart';
import 'responsive/responsive_layout.dart';

// Mobile Views
import 'responsive/mobile/example_routing.dart';
import 'responsive/mobile/home.dart';

// Web Views
import 'responsive/web/example_routing.dart';
import 'responsive/web/home.dart';

void main() {
  runApp(const MyApp());
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
          mobileBody: HomeMenuMobile(),
          desktopBody: HomeMenuDesktop(),
        ),
        '/home': (context) => const ResponsiveLayout(
          mobileBody: HomeMenuMobile(),
          desktopBody: HomeMenuDesktop(),
        ),
        '/ex-rout': (context) => const ResponsiveLayout(
          mobileBody: ExampleRoutingMobile(),
          desktopBody: ExampleRoutingDesktop(),
        )
      },
    );
  }
}

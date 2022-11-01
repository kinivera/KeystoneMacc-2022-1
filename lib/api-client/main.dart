import 'package:flutter/material.dart';
import 'api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService api = ApiService();

  late Future<AuthCheck> _checkingAuth;
  //late Future<AV> _ambientVariables;
  late Future<AVI> _ambVarInterval;

  @override
  void initState() {
    super.initState();
    //_checkingAuth = api.authUser("dave", "supertactica");
    //_ambientVariables = api.getAmbVar();
    _ambVarInterval = api.getAmVarInt(
        'dave',
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        'temperature');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<AVI>(
            future: _ambVarInterval,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.time['0']);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

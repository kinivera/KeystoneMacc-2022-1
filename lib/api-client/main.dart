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
  late Future<AuthCheck> _checkAuthbyEmail;

  late Future<AV> _ambientVariables;
  late Future<AV> _ambientVariables2;

  late Future<AVI> _ambVarInterval;
  late Future<AVI> _ambVarInterval2;
  late Future<String> _writeAVI;

  late Future<AC> _actuatorConfig;
  late Future<AC> _actuatorConfig2;
  late Future<String> _writeAC;

  late Future<String> _newUser;
  late Future<String> _newMicro;
  late Future<String> _newTopic;

  @override
  void initState() {
    super.initState();
    //_checkingAuth = api.authUserbyUsername("dave", "supertactica");
    //_checkAuthbyEmail = api.authUserbyEmail('valid@email.com', 'supertactica');
    /*_ambientVariables = api.getAV(
        'dave',
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        'temperature',
        '2022/12/12 10:00:00',
        '2022/12/24 10:00:01');*/
    /*_ambVarInterval = api.getAmVarInt(
        'dave',
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        'temperature');*/
    /*_writeAVI = api.writeAmbVarInterval(
        'dave',
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        'temperature',
        [14, 20],
        [16, 19]);*/

    //_newUser = api.addUser("arevalo", "valido@email.com", "1q2w3e4r5t6y");
    /*_newMicro = api.addMicrcontroller(
        "dave",
        "46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8",
        "00:00:00:00:00:69",
        "jotaro"); */ // Sadlría bien en contexto de un botón
    /*_newTopic = api.addTopic(
        "dave",
        "efabe459cbba64347969017bb8b8acaa2c75e66fd9e8e3700d91628fd0934c7130bc49cc35d340e601c10c7818d3a0c1c419cf5d8fcb18edbd8680e6d9b76b75",
        "esp32/dave/00:00:00:00:00:69/temperature");*/

    /*_actuatorConfig = api.getActConfig(
        "dave",
        "46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8",
        "water pump");*/

    /* _writeAC = api.writeActuatorsConfig(
        "dave",
        '46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8',
        "water pump",
        "10:00:00",
        "10:00:01",
        0,
        1);*/
    _ambientVariables2 = api.getAV2("dave",
        "46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8");

    /*_ambVarInterval2 = api.getAmVarInt2(
      "dave",
      "46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8",
    );*/
    /*_actuatorConfig2 = api.getActConfig2("dave",
        "46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8");*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<AV>(
            future: _ambientVariables2,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("${snapshot.data!.varname['2']}");
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}



//var = {0:tem, 1:hum, 2:lol, 3:tem}
//min_ac = {0:a, 1:b, 2:c, 3:d}

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:api_test_3/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final HttpLink httplink = new HttpLink(uri:'http://198.58.120.188:5000/graphql');
  //final HttpLink httplink = new HttpLink(uri: 'https://graphqlzero.almansi.me/api');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> cliente = new ValueNotifier<GraphQLClient>(GraphQLClient(link: httplink, cache: InMemoryCache()));
    return GraphQLProvider(
      client: cliente,
      child: MaterialApp(
        title:'Material App',
        home: HomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/*
 *
 *            STRING QUERIES DEFINITION
 *
 */

class Queries{
  const Queries();

  /*
      QUERIES
   */

  final String getAllVariables = """ query{variables {id,name,units,desc}}""";
  final String logIn = r"""
      query logIn($username: String!, $password: String!){
        logIn(username: $username, password: $password)
      }""";
  final String getMeasurements = r"""
    query measurements($apiKey: String!, $nMeasurements: Int!, $startTime: String!, $endTime: String!){
      measurements(apiKey: $apiKey, nmeasurements: $nMeasurements, startTime: $startTime, endTime: $endTime) {
        id,
        variableId,
        value, 
        time
    }
  }""";

  /*
      MUTATIONS
   */

  final String signUp = r"""
      mutation signUp($username: String!, $email: String!, $password: String!){
        signUp(username: $username, email: $email, password: $password) {ok}
      }""";
}

/*
 *
 *            API CLIENT DEFINITION
 *
 */

class AppApiClient with ChangeNotifier{

  late GraphQLClient client;
  late Queries queries;
  late String _apiKey;

  Map<String, Object?> responses = {};
  bool _signedIn = false;
  bool _loggedIn = false;
  bool _loading = false;

  /*
   *          GETTERS
   */

  get loggedIn{
    return _loggedIn;
  }

  get loading{
    return _loading;
  }

  get signedIn{
    return _signedIn;
  }


  /*
   *          CONSTRUCTOR
   */

  AppApiClient(){
    //creates the graphql client
    HttpLink link = HttpLink("http://127.0.0.1:5000/graphql");
    client = GraphQLClient(link: link,
                           cache: GraphQLCache(
                                                store: HiveStore(),
                                              )
                          );

    //instance of the class which contains the string queries
    queries = const Queries();
  }


  /*
   *
   *           METHODS
   *
   */

  void logOut(){
    _loggedIn = false;
    _signedIn = false;
    _loading = false;
    _apiKey = '';
  }

  /*
      User Log In
   */
  Future<void> authUser(String username, String password)async{

        QueryResult queryResult = await client.query(
          QueryOptions(document: gql(queries.logIn),
                       variables: {'username': username,
                                   'password': password}),
        );


        //some error while making the query or getting response
        if (queryResult.hasException) {
          debugPrint("got an exception on LOG IN: ");
          debugPrint(queryResult.hasException.toString());
          return;
        }

        //loading
        if (queryResult.isLoading) {
          debugPrint("Logging user in...");
          _loading = true;
          notifyListeners();
        }else{
          debugPrint("User logged in.");
          _loading = false;
          notifyListeners();
        }

        String? response = queryResult.data?['logIn'];
        debugPrint('got answer:');
        debugPrint("$response \n");

        if (response == null) {
          return ;
        }else{
          _loggedIn = true;
          _apiKey = response;
        }

  }

  /*
      User Sign In
   */

  Future<void> signIn(String username, String email, String password)async{
        QueryResult queryResult = await client.query(
          QueryOptions(document: gql(queries.signUp),
              variables: {'username': username,
                          'email': email,
                          'password': password}),
        );


        //some error while making the query or getting response
        if (queryResult.hasException) {
          debugPrint("got an exception on SIGN IN: ");
          debugPrint(queryResult.hasException.toString());
          return;
        }

        //loading
        if (queryResult.isLoading) {
          debugPrint("Signing user in...");
          _loading = true;
          //notifyListeners();
        }else{
          debugPrint("User signed in.");
          _loading = false;
          //notifyListeners();
        }

        Map<String, dynamic>? response = queryResult.data?['signUp'];
        debugPrint('got answer:');
        debugPrint(response.toString());

        if (response == null){
          return;
        }else if(response['ok'] == 'true') {
          return;
        }else{
          _signedIn = true;
        }
  }

  /*
   *
   *         GETTERS FROM API (QUERIES)
   *
   */

  /*
      Get all ambient variables available
   */
  Future<List<Object?>> getAllVariables() async{
    QueryResult queryResult = await client.query(
        QueryOptions(document: gql(queries.getAllVariables)));

        //some error while making the query or getting response
        if (queryResult.hasException) {
          debugPrint("got an exception: ");
          debugPrint(queryResult.hasException.toString());
          return [];
        }

        //loading
        if (queryResult.isLoading) {
          debugPrint("Loading variables from API...");
          _loading = true;
          //notifyListeners();
        }else{
          debugPrint("Loaded variables from API.");
          _loading = false;
          //notifyListeners();
        }

        //got a result
        List? variables = queryResult.data?['variables'];

        if (variables == null) {
              return [];
            }else{

              // the IDs coming from the response are text, but
              // We want to have them also as numeric IDs, so we add
              // that field to each individual response
              for(int i = 0; i < variables.length; i++){
                variables[i]!['id2'] = "$i";
                variables[i]!['state'] = false;
              }

              debugPrint('\ngot variables: ');
              debugPrint(variables.toString());
              responses['variables'] = variables;
              return variables;
            }
  }

  /*
      Get all measurements between a time span
   */
  Future<List<Object?>> getMeasurements({nMeasurements = 100,
                                         startTime = "",
                                         endTime = ""}) async{

        QueryResult queryResult = await client.query(
                                  QueryOptions(document: gql(queries.getMeasurements),
                                  variables: {'apiKey': _apiKey,
                                              'nMeasurements': nMeasurements,
                                              'startTime': startTime,
                                              'endTime': endTime}));

        //some error while making the query or getting response
        if (queryResult.hasException) {
          debugPrint("\ngot an exception *- at getMeasurements -*: ");
          debugPrint(queryResult.hasException.toString());
          debugPrint(queryResult.toString());
          return [];
        }

        //loading
        if (queryResult.isLoading) {
          debugPrint("Getting measurements...");
          _loading = true;
          //notifyListeners();
        }else{
          debugPrint("Got measurements.");
          _loading = false;
          //notifyListeners();
        }

        //got a result
        List? measurements = queryResult.data?['measurements'];
        debugPrint("\n Data is ${measurements?.length} long :\n ${measurements.toString()}");

        if (measurements == null){
          return [];
        }else{
          responses['measurements'] = measurements;
          return measurements;
        }

  }


}


/*
 *
 *              OTHER UTILS
 *
 */

bool isPasswordValid(String password) => password.length >= 8;
bool isUserValid(String user) => (user.length >= 4) && (user.length <= 60);
bool isEmailValid(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

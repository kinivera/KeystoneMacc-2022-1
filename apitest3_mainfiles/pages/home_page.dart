import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key key}) : super(key: key);

 /* final String getAlbum = """
        query getAlbums{
              albums(options:{paginate:{page:1, limit:4}}){
                  data{
                       id
                       title
                        user{
                          name
                          username
                          email
                        } 
                  }
              }
         }
    """;

  */


  final testQuery = """query testQuery{authUserByUsername(username: "dave", password: "supertactica")} """;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Query(
              options: QueryOptions(
                documentNode: gql(testQuery),
              ),
            builder: (result, {fetchMore, refetch}) {
                if(result.hasException){
                  return Text(result.exception.toString());
                }
                if(result.loading){
                  return Center(child: CircularProgressIndicator());
                }
                //List Albums = result.data['albums']['data'];
                List testRes = result.data['authUserByUsername'];
                //  print(Albums);
                print(testRes);
                return ListView.builder(
                  itemCount: testRes.length, itemBuilder: (context, index){
                    final album = testRes[index]['title'];
                    return ListTile(
                      title: Text(album)
                    );
                });
            })
          ),
      );
  }
}

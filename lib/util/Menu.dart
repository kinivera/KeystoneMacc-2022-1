import 'package:flutter/material.dart';
import 'package:responsivedashboard/userDataProvider/data_provider.dart';
import '../constants.dart';
import 'ButtonMenu.dart';

//API connection
import 'package:provider/provider.dart';
import '../../userDataProvider/api-client/api-client.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    AppApiClient client =  Provider.of<DataProvider>(context).apiClient;

    return Drawer(
      backgroundColor: menuColorBackgr,
      elevation: 0,
      child: Column(
        children: [
          InkWell(
              onTap: (){Navigator.of(context).pushNamed('/home');},
              child:const DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                      color: menuColorBackgr,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logoApp.png"))
              )
              )
          ),
          
          ButtonMenu(icono: Icons.add_task, texto:'E X P O R T   S E L E C T E D\nD A T A ', answer: (){
            //api.getSelectedAVasJson(user, token, beginDate, endDate);
          }), 
          ButtonMenu(icono: Icons.file_download, texto:'E X P O R T   A L L  D A T A ', answer: (){
            //api.getAllAVasJson(user, token);
            }),

          ButtonMenu(icono: Icons.settings, texto:'S E T T I N G S', answer: (){
            Navigator.of(context).pushNamed('/settings');
          }),

          ButtonMenu(icono: Icons.info, texto:'A B O U T', answer: (){
            Navigator.of(context).pushNamed('/about');
          }),

          ButtonMenu(icono: Icons.logout, texto:'L O G O U T', answer:(){
            client.logOut();
            Navigator.of(context).pushNamed('/');
          }),
        ],
      ),
    );
  }
}


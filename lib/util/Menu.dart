import 'package:flutter/material.dart';
import '../constants.dart';
import 'ButtonMenu.dart';
import '../api-client/api_client.dart';

class Menu extends StatelessWidget {

  ApiService api = ApiService();
  String user ='dave';
  String token ='46399ec9bb61442d6988d5daaf58e16cf58c4e03dfa75b1a00b99e567446293689ce24f6db220f02932561a408e8b15e29e06d6cb2b44c8032619a655da7ede8';
  String beginDate = searchIntervals["beginDate"] ?? "2020/11/10 00:00:01";
  String endDate = searchIntervals["endDate"] ?? "2024/11/16 23:00:01";

  Menu({super.key });

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage("/images/logoApp.png")),
          ))
          ),
          
          ButtonMenu(icono: Icons.add_task, texto:'E X P O R T   S E L E C T E D\nD A T A ', answer: (){
            api.getSelectedAVasJson(user, token, beginDate, endDate);
          }), 
          ButtonMenu(icono: Icons.file_download, texto:'E X P O R T   A L L  D A T A ', answer: (){
            api.getAllAVasJson(user, token);
            }),
          ButtonMenu(icono: Icons.settings, texto:'S E T T I N G S', answer: (){Navigator.of(context).pushNamed('/settings');}),
          ButtonMenu(icono: Icons.info, texto:'A B O U T', answer: (){Navigator.of(context).pushNamed('/about');}),
          ButtonMenu(icono: Icons.logout, texto:'L O G O U T', answer:(){Navigator.of(context).pushNamed('/');}),
        ],
      ),
    );
  }
}


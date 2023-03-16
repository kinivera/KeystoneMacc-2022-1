import 'package:flutter/material.dart';
import '../../../constants.dart';

import 'package:responsivedashboard/Views/Signup/signup_screen.dart';
import 'package:responsivedashboard/Widgets/already_have_an_account_acheck.dart';
import 'package:responsivedashboard/StateManagement/home_view_widgets_state_manager.dart';


//API
import 'package:provider/provider.dart';
import 'package:responsivedashboard/DataProvider/data_provider.dart';
import 'package:responsivedashboard/DataProvider/ApiClient/api_client.dart';

//https://www.topcoder.com/thrive/articles/form-validation-in-flutter


class AboutText extends StatefulWidget {
  const AboutText({Key? key}) : super(key: key);

  @override
  State<AboutText> createState() => _AboutTextState();
}

class _AboutTextState extends State<AboutText> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final formGlobalKey = GlobalKey <FormState> ();


  @override
  Widget build(BuildContext context) {
    //gets the APIClient instance from the data provider
    DataProvider dataProvider =  Provider.of<DataProvider>(context);
    HomeAmbientVariableDashboard states =  Provider.of<HomeAmbientVariableDashboard>(context);
    print("en about general");
    return Form(
      key: formGlobalKey,
      child: Column(
        children: [

          //About text!
          Text("Maticas es un sistema de cultivos hidropónicos automatizados, basados en código abierto y hardware de acceso abierto, que busca contribuir a la generación de una revolución agroindustrial en Colombia y en el mundo, desde la agricultura de precisión a través de la hidroponía.",
          textAlign: TextAlign.center),

          
        ],
      ),
    );
  }
}




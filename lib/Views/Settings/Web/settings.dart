import 'package:flutter/material.dart';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/Widgets/menu.dart';
import 'package:responsivedashboard/Widgets/conditions_table.dart';


class SettingsDesktop extends StatefulWidget {
  const SettingsDesktop({Key? key}) : super(key: key);

  @override
  State<SettingsDesktop> createState() => _SettingsDesktopState();
}

class _SettingsDesktopState extends State<SettingsDesktop> {
  bool ver1 = false;
  bool ver2 = false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: topBar,
      drawer: const Menu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[

              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 30,
                minWidth: 200,
                color: Theme.of(context).primaryColor,
                height: 60,
                child: Text(
                  "Create Organization",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    ver1 = true;
                    ver2 = false;
                  });
                },
              ),

              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 30,
                minWidth: 200,
                color: Theme.of(context).primaryColor,
                height: 60,
                child: Text(
                  "Configure Intervals",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    ver1 = false;
                    ver2 = true;
                  });
                },
              ),

              Visibility(
                  visible: ver1,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        onChanged: (user) {
                          debugPrint(user);
                        },
                        onSaved: (user) {
                          debugPrint(user);
                        },
                        validator: (user) {},
                        decoration: const InputDecoration(
                          hintText: "Name",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Icon(Icons.person),
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        onChanged: (user) {
                          debugPrint(user);
                        },
                        onSaved: (user) {
                          debugPrint(user);
                        },
                        validator: (user) {},
                        decoration: const InputDecoration(
                          hintText: "Description",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Icon(Icons.description),
                          ),
                        ),
                      )
                    ],
                  )),

              Visibility(
                  visible: ver2,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: ConditionsTable()
                  )

            ],
          ),
        ),
      ),
    );
  }
}

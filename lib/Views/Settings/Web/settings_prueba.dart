import 'package:flutter/material.dart';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/Widgets/menu.dart';
import 'package:responsivedashboard/Widgets/dropdownzona.dart';
import 'package:responsivedashboard/Widgets/remainder_test.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingsDesktop2 extends StatefulWidget {
  const SettingsDesktop2({Key? key}) : super(key: key);

  @override
  State<SettingsDesktop2> createState() => _SettingsDesktop2State();
}

class _SettingsDesktop2State extends State<SettingsDesktop2> {
  final _formKey = GlobalKey<FormState>();
  String _forumText = "";
  bool ver1 = false;
  bool ver2 = false;

  //DateTime selectedDate = DateTime.now();

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
              const Text(''),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  // Show the registration form
                  showRegistrationForm(context);
                },
                child: const Text('CREATE ORGANIZATION'),
              ),
              const Text(''),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  showAddPersonForm(context);
                },
                child: const Text('ADD PERSON'),
              ),
              const Text(''),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  //showRemainderSetUP(context);
                  //print('REMINDERS');
                  showSetupRemainder(context);
                },
                child: const Text('REMINDERS'),
              ),
              const Text(''),
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
                  child: DataTable(
                    sortColumnIndex: 2,
                    sortAscending: false,
                    columns: [
                      DataColumn(label: Text("Variable")),
                      DataColumn(label: Text("Zone")),
                      DataColumn(label: Text("Min"), numeric: true),
                      DataColumn(label: Text("Max"), numeric: true),
                    ],
                    rows: [
                      DataRow(selected: true, cells: [
                        DataCell(Text("Temperature")),
                        DataCell(Text("Teslab")),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("PH")),
                        DataCell(Text("Teslab")),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true)
                      ]),
                      DataRow(selected: true, cells: [
                        DataCell(Text("Water temperature")),
                        DataCell(Text("Teslab")),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Preassure")),
                        DataCell(Text("Teslab")),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                      ]),
                      DataRow(selected: true, cells: [
                        DataCell(Text("Light")),
                        DataCell(Text("Teslab")),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Electroconductivity")),
                        DataCell(Text("Teslab")),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              initialValue: '0',
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (val) {
                                setState(() {
                                  //you can do anything you want
                                });
                              },
                            ),
                            showEditIcon: true)
                      ]),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void showRegistrationForm(BuildContext context) {
    // Create the registration form
    Widget registrationForm = Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          ElevatedButton(
            child: Text('Create'),
            onPressed: () {
              // Process the registration data
              // (you can add your own logic here)
              // ...

              // Close the dialog
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    // Show the registration form in a dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Organization'),
          content: registrationForm,
        );
      },
    );
  }

  void showAddPersonForm(BuildContext context) {
    Widget addPersonForm = Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'E-mail'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Rol'),
          ),
          DropdownButtonZona(),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Person'),
          content: addPersonForm,
        );
      },
    );
  }

  void showSetupRemainder(BuildContext context) {
    Widget setupRemainderForm = Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NotificationButton(),
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set-up Remainder'),
          content: setupRemainderForm,
        );
      },
    );
  }
}

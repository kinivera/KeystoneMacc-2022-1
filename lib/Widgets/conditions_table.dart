import 'package:flutter/material.dart';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/Widgets/menu.dart';
import 'package:responsivedashboard/Widgets/dropdown.dart';


class ConditionsTable extends StatefulWidget {
  const ConditionsTable({super.key});

  @override
  State<ConditionsTable> createState() => _ConditionsTableState();
}

class _ConditionsTableState extends State<ConditionsTable> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
                   child: Form(key: _formKey,
                     child: Column(
                      children: <Widget>[
                                 DataTable( sortColumnIndex: 2,
                                    sortAscending: false,

                                    columns: const [
                                      DataColumn(label: Text("Ambiental Variable")),
                                      DataColumn(label: Text("Zone")),
                                      DataColumn(label: Text("Min"), numeric: true),
                                      DataColumn(label: Text("Max"), numeric: true),
                                    ],

                                    rows: [
                                      DataRow(selected: true,
                                              cells: [
                                              DataCell(Text("Temperature")),
                                              DataCell(Text("ZONE PLACE HOLDER")),
                                              DataCell(
                                                  //min value

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
                                  ),

                                  SizedBox(height: 16.0),

                                  ElevatedButton(
                                     onPressed: (){
                                        // Validate returns true if the form is valid, or false otherwise.
                                        if (_formKey.currentState!.validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data...')),);
                                        }
                                    },
                                     child: const Text('Save changes'),
                                   ),

                  ]),
                ),
    );
  }
}



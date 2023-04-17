import 'package:flutter/material.dart';

import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/Widgets/menu.dart';
import 'package:responsivedashboard/Widgets/dropdown.dart';

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
  
  
  DateTime selectedDate = DateTime.now();

  Future<DateTime> _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  } 
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
                Text(''),               
                ElevatedButton(
                      style:   ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                        
                      ),
                      onPressed:() {
                          // Show the registration form
                          showRegistrationForm(context);
                          },
                      child: Text('CREATE ORGANIZATION'),         
                    ),
                
                Text(''),
                ElevatedButton(
                      style:   ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {
                        showAddPersonForm(context);
                        },
                      child: Text('ADD PERSON'),
                ),
                ElevatedButton(
                      style:   ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                      ),
                      onPressed: () => {
                        print("CONFIGURE INTERVALS")
                        },
                      child: Text('CONFIGURE INTERVALS'),
                ),
                Text(''),
                ElevatedButton(
                      style:   ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                      ),
                      onPressed: ()  {
                        showRemainderSetUP(context);
                      },
                      child: Text('REMINDERS'),
                ),
                Text(''),

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
          title: Text('Create Organization'),
          content: registrationForm,
        );
      },
    );
  }

  void showAddPersonForm(BuildContext context){
    Widget addPersonForm = Container (
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'E-mail'
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Rol'
            ),
          ),
          DropdownButtonExample(),
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
          title: Text('Add Person'),
          content: addPersonForm,
        );
      },
    ); 
  }

  void showRemainderSetUP(BuildContext context){
    Widget reminderSetup= Container (
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              await _selectDate(context);
            },
            child: Text(
              'Select Date',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.pop(context);
            }, 
          ),
          Text('Selected date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',),
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Set-Up Reminder'),
          content: reminderSetup,
        );
      },
    ); 
  }

}


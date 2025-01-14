import 'package:flutter/material.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: ExampleForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExampleForm extends StatefulWidget {
  @override
  _ExampleFormState createState() => _ExampleFormState();
}

GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

class _ExampleFormState extends State<ExampleForm> {
  int myNumber = 0;
  String myValue = 'No value saved yet.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Form Field Example'),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioButtonFormField(
                toggleable: true,
                padding: EdgeInsets.all(8),
                context: context,
                value: 'value',
                display: 'display',
                data: data,
                onSaved: (value) {
                  setState(() {
                    myNumber = value;
                    myValue = value.toString();
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),
              Text(myValue)
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    var formState = myFormKey.currentState!;
    if (formState.validate()) {
      formState.save();
      print(myNumber);
    }
  }
}

final List<Map> data = [
  {'value': 1, 'display': 'One'},
  {'value': 2, 'display': 'Two'},
  {'value': 3, 'display': 'Three'}
];

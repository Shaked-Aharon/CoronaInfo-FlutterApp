import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ContactusPage extends StatefulWidget {
  @override
  _ContactusPageState createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {
  final _formKey = GlobalKey<FormState>();
  bool validateEmail(String value) {
    Pattern pattern = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
  String subject = 'טופס יצירת קשר';
  String fullName = '';
  String email = '';
  String phone = '';
  String notes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('יצירת קשר לספקים'),
      ),
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Card(
      elevation: 3.0,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    fullName = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: "שם מלא", hintText: 'ברי צאקאלה'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'אנא הכנס את שמך המלא';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "מייל", hintText: 'example@coronainfo.co.il'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'אנא הזן כתובת מייל';
                  }
                  if (!validateEmail(value)) {
                    return 'אנא הזן כתובת מייל חוקית';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: "פלאפון", hintText: '05X-XXX-XXXX'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.length < 8 || value.length > 11) {
                    return 'הכנס מספר פלאפון תקין בבקשה';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    notes = value;
                  });
                },
                decoration: InputDecoration(labelText: "הערות", hintText: ''),
                validator: (value) {
                  return null;
                },
              ),
              // Spacer(),
              Center(
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width * 0.4)),
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.

                      await post('https://coronainfo.co.il/endpoint/email', body: {
                        'subject': subject,
                        'fullName': fullName,
                        'email': email,
                        'phone': phone,
                        'notes': notes
                      });
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('הטופס נשלח בהצלחה'), duration: Duration(seconds: 1),));
                    }
                  },
                  child: Text('שלח'),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
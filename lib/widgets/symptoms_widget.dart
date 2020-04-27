import 'package:flutter/material.dart';

class SymptomsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                'תסמינים נפוצים לנגיף הקורונה:',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 24.0),
              ),
            ),
            Text("""
אצל מרבית החולים ניתן לזהות את התסמינים חום(88%) ושיעול יבש(68%)
ובחלק מהמקרים ניתן לזהות גם:
עייפות(38%), ליחה(33%), קוצר נשימה(19%),
כאבי שרירים או מפרקים(15%), כאב גרון(14%), כאב ראש(14%) וצמרמורות(11%)"""),
          ],
        ),
      ),
    );
  }
}

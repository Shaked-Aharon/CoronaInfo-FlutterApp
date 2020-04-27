import 'package:covid19_app/widgets/cardbasic_widget.dart';
import 'package:covid19_app/widgets/cardimage_widget.dart';
import 'package:covid19_app/widgets/qanda_widget.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/models/directive_model.dart';

class DirectivePage extends StatefulWidget {
  @override
  _DirectivePageState createState() => _DirectivePageState();
}

class _DirectivePageState extends State<DirectivePage> {
  List<Widget> children = [Text('asd')];

  void getChildren() {
    final List<Widget> temp = [];
    // temp.add(CardBasicWidget(title: 'תקנות לשעת חירום – הנחיות משרד הבריאות', content: '',));
    for(var i = 0; i < directives.length; i++){
      temp.add(CardBasicWidget(title: directives[i]['title'], content: directives[i]['content'],));
    }
    temp.add(CardImageWidget(imgName: 'directive.jpeg',));
    temp.add(QandAWidget());
    setState(() {
      children = [...temp];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('הנחיות'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Column(children: <Widget>[...children],)
        ),
      ),
    );
  }
}

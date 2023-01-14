import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  initState() {
    sessionfucnction();
  }
var sessionManager = SessionManager();
  sessionfucnction()async{
  var id = await SessionManager().get("id");
  print(id);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Text('test page'),
    );
  }
}

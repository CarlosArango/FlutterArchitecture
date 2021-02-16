import 'package:flutter/material.dart';
import 'package:flutter_fetch/modules/users/widgets/user_item_widget.dart';

class UsersUI extends StatefulWidget {
  UsersUI({Key key}) : super(key: key);

  @override
  _UsersUIState createState() => _UsersUIState();
}

class _UsersUIState extends State<UsersUI> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Column(
        children: <Widget>[
          UserItemWidget(),
          FlatButton(
            child: Text("+"),
            onPressed: () {
              setState(() {
                count = count + 1;
              });
            },
          ),
          Text(count.toString()),
        ],
      ),
    );
  }
}

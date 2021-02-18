import 'package:flutter/material.dart';
import 'package:flutter_fetch/models/user.dart';
import 'package:flutter_fetch/modules/users/widgets/user_item_widget.dart';
import 'package:flutter_fetch/resources/repositories/users_repo.dart';

class UsersUI extends StatefulWidget {
  UsersUI({Key key}) : super(key: key);

  @override
  _UsersUIState createState() => _UsersUIState();
}

class _UsersUIState extends State<UsersUI> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    getApiUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: onHandlePressedButton,
            child: Text("Get Users"),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, i) {
                  return UserItemWidget(
                    user: users[i],
                  );
                }),
          ),
        ],
      ),
    );
  }

  void onHandlePressedButton() {}

  void getApiUsers() async {
    final userRepo = UsersRepo();
    final usersApi = await userRepo.getUsers();
    this.setState(() {
      users = usersApi;
    });
  }
}

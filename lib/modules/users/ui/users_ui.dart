import 'package:flutter/material.dart';
import 'package:flutter_fetch/models/user.dart';
import 'package:flutter_fetch/modules/users/widgets/user_item_widget.dart';
import 'package:flutter_fetch/resources/providers/api_jsonplaceholder_user.dart';

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

  void getApiUsers() async {
    final apiJsonPlaceHolderUser = ApiJsonplaceholderUser();
    final usersApi = await apiJsonPlaceHolderUser.getUsers();
    this.setState(() {
      users = usersApi;
    });
  }
}

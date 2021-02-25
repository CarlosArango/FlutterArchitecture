import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch/modules/users/blocs/fetch_users/fetch_users_bloc.dart';
import 'package:flutter_fetch/modules/users/blocs/fetch_users/fetch_users_event.dart';
import 'package:flutter_fetch/modules/users/blocs/fetch_users/fetch_users_state.dart';
import 'package:flutter_fetch/modules/users/widgets/user_item_widget.dart';
import 'package:flutter_fetch/resources/repositories/users_repo.dart';

class UsersUI extends StatelessWidget {
  const UsersUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
        ),
      ),
      body: BlocProvider<FetchUsersBloc>(
        create: (context) => FetchUsersBloc(
          usersRepo: UsersRepo(),
        ),
        child: Column(
          children: <Widget>[
            BlocListener<FetchUsersBloc, FetchUsersState>(
              condition: (prevState, currentState) {
                return (currentState.status != FetchUserStatus.loading);
              },
              listener: (context, state) {
                print(" Listener${state.status}");
                if (state.status == FetchUserStatus.success) {
                  _showMyDialog(context);
                }
              },
              child: BlocBuilder<FetchUsersBloc, FetchUsersState>(
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      state.status != FetchUserStatus.loading
                          ? FlatButton(
                              onPressed: () => onHandlePressedButton(context),
                              child: Text("Fetch user"),
                            )
                          : Container(),
                      state.status == FetchUserStatus.loading
                          ? CircularProgressIndicator()
                          : Container(),
                      state.status == FetchUserStatus.success
                          ? Container(
                              height: 600,
                              child: ListView.builder(
                                itemBuilder: (context, i) {
                                  return UserItemWidget(
                                    user: state.users[i],
                                  );
                                },
                                itemCount: state.users.length,
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onHandlePressedButton(context) {
    BlocProvider.of<FetchUsersBloc>(context).add(ButtonPressedFetchUserEvent());
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Usuarios cargados'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

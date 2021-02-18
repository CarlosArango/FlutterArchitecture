import 'package:flutter/material.dart';
import 'package:flutter_fetch/models/user.dart';

class UserItemWidget extends StatelessWidget {
  final User user;
  const UserItemWidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build user item widget ");
    return Container(
      child: Card(
        color: Colors.black12,
        elevation: 2,
        child: Container(
          alignment: Alignment.center,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://images.unsplash.com/photo-1425321505542-00715f6a9c28?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit"),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

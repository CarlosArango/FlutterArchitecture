import 'package:flutter/material.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              IconButton(icon: Icon(Icons.verified_user), onPressed: () {}),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Luciano",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Email",
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

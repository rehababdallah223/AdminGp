import 'package:admin_test/models/user.dart';
import 'package:admin_test/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UsersList.dart';


class UserManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserDetails>>.value(
      value: DatabaseService().user,
          child: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: UsersList(),
              ),
          ],
        )
          ),
    );
  }
}

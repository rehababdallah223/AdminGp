
import 'package:admin_test/models/OnlineBook.dart';
import 'package:admin_test/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UsersTile.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {

    final users= Provider.of<List<UserDetails>>(context);

    return ListView.builder(
      itemCount: users == null ? 0 :users.length,
  
      itemBuilder: (BuildContext context,int index) => UsersTile(
        user: users[index],
      )


       );
  }
}
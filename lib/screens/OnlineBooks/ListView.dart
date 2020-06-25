import 'package:admin_test/models/OnlineBook.dart';
import 'package:admin_test/screens/OnlineBooks/OnlineBookList.dart';
import 'package:admin_test/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListViewOnlineBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OnlineBook>>.value(
      value: DatabaseService().onlineBooks,
          child: Scaffold(
        appBar: AppBar(
          title: Text('Online Books'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: OnlineBookList(),
              ),
          ],
        )
          ),
    );
  }
}

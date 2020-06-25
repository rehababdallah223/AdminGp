import 'package:admin_test/models/book.dart';
import 'package:admin_test/models/user.dart';
import 'package:admin_test/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BooksList.dart';

class BookManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>>.value(
      value: DatabaseService().books,
          child: Scaffold(
        appBar: AppBar(
          title: Text('Books'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: BooksList(),
              ),
          ],
        )
          ),
    );
  }
}

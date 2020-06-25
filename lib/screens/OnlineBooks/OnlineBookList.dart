
import 'package:admin_test/models/OnlineBook.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'OnlineBookTile.dart';

class OnlineBookList extends StatefulWidget {
  @override
  _OnlineBookListState createState() => _OnlineBookListState();
}

class _OnlineBookListState extends State<OnlineBookList> {
  @override
  Widget build(BuildContext context) {
 //fillBookData();
    final userBooks= Provider.of<List<OnlineBook>>(context);

    return ListView.builder(
      itemCount: userBooks == null ? 0 :userBooks.length,
  
      itemBuilder: (BuildContext context,int index) => OnlineBookTile(
        book: userBooks[index],
      )


       );
  }
}

import 'package:admin_test/models/OnlineBook.dart';
import 'package:admin_test/models/book.dart';
import 'package:admin_test/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BookTile.dart';

class BooksList extends StatefulWidget {
  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {

    final books= Provider.of<List<Book>>(context);

    return ListView.builder(
      itemCount: books == null ? 0 :books.length,
  
      itemBuilder: (BuildContext context,int index) => BooksTile(
        book: books[index],
      )


       );
  }
}
import 'package:flutter/material.dart';

import '../dummy-data.dart';

class AdminBooksScreen extends StatefulWidget {
  @override
  _AdminBooksScreenState createState() => _AdminBooksScreenState();
}

class _AdminBooksScreenState extends State<AdminBooksScreen> {
  void removeBook (String id)
  {

    setState(() {
      DUMMY_BOOKS.removeWhere((book){
        return book.id == id;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return BookItem(
            id: DUMMY_BOOKS[index].id,
            title: DUMMY_BOOKS[index].title,
            authorName: DUMMY_BOOKS[index].authorName,
            imageUrl: DUMMY_BOOKS[index].imageUrl,
            removeBook: removeBook,


          );
        },
        itemCount: DUMMY_BOOKS.length,
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String id;
  final String title;
  final String authorName;
  final String imageUrl;
  final Function removeBook;

  BookItem({
    @required this.id,
    @required this.title,
    @required this.authorName,
    @required this.imageUrl,
    @required this.removeBook
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(60),
              color: Colors.grey),
          child: Image.network(
            imageUrl,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        //--------------subtitle -----------
        subtitle: Text(authorName),
        //---------------------------
        trailing: IconButton(
          onPressed: () => removeBook(id),
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

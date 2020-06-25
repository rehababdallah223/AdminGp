
import 'package:admin_test/models/book.dart';
import 'package:admin_test/models/category.dart';
import 'package:admin_test/models/user.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';

class BooksTile extends StatelessWidget {
  final Book book;
  BooksTile({this.book});
  final DatabaseService _database = DatabaseService();
  List<Categoreey> categories = [];
  static String cat ="" ;


_BooksTileState(){
  _getCategory();
}


  Future deletebook(String docId) async{
    DatabaseService service = new DatabaseService();
    await service.deleteBook(docId);
    return;
  }

  _getCategory() async {
    categories = await _database.getCategories();
   cat= categories.firstWhere((cat) => cat.id == book.selectedCategory).title;
  }
  @override
    Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,6,20,0),
        child: ListTile(
          title: Text(book.bookName,),
          subtitle: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Row(children:<Widget>[
                Text('Author Name: '),
                Text(book.authorName),
              ]),
              SizedBox(height: 3,),
              Row(children:<Widget>[
                Text('User: '),
                Text(book.userName),
              ]),          
              SizedBox(height: 3,),
            /*  Row(children:<Widget>[
                Text('Describtion: '),
                Text(book.describtion),
              ]), */   

              
            
            ],
          ),

          trailing: IconButton(
            icon: Icon(Icons.delete,color: Colors.red,),
           onPressed: () async{
             await deletebook(book.documentId);
             },
           ) ,
        ),
      ),
    );
  }
}
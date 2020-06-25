
import 'package:admin_test/models/OnlineBook.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';

class OnlineBookTile extends StatelessWidget {
  final OnlineBook book;
  OnlineBookTile({this.book});

  Future deletebook(String docId) async{
    DatabaseService service = new DatabaseService();
    await service.deleteOnlineBook(docId);
    return;
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
                Text('Price: '),
                Text("\$${book.price}"),
              ]),
              SizedBox(height: 3,),
              Row(children:<Widget>[
                Text('Quantity: '),
                Text("\$${book.quantity}"),
              ]),              

              
            
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

import 'package:admin_test/models/category.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';

class CategoryTile extends StatelessWidget {
  final Categoreey category;
  CategoryTile({this.category});

  Future deletebook(String docId) async{
    DatabaseService service = new DatabaseService();
    await service.deleteCategory(docId);
    return;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,6,20,0),
        child: ListTile(
          title: Text(category.title),
          trailing: IconButton(
            icon: Icon(Icons.delete,color: Colors.red,),
           onPressed: () async{
             await deletebook(category.id);
             },
           ) ,
        ),
      ),
    );
  }
}
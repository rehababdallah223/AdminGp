import 'package:admin_test/models/category.dart';
import 'package:admin_test/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../dummy-data.dart';
import 'categories-list.dart';
import 'new-category.dart';



class AdminCategoriesScreen extends StatefulWidget {

  @override
  _AdminCategoriesScreenState createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends State<AdminCategoriesScreen> {
Future Add(String categoryName) async
{
  await DatabaseService().updateUserData(categoryName);

}

  void addNewCategory(String categoryTitle, String categoryid) {
    final newcat = Categoreey(
        id: categoryid,
      title: categoryTitle,
    );
    setState(() {
     // DUMMY_CATEGORIES.add(newcat);
    });
  }

  void showAddNewCategory(
      BuildContext ctx,
      ) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewCategory(Add),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Categoreey>>.value(
      value: DatabaseService().categories,
          child: Scaffold(appBar: AppBar(title: Text('App'),),
      body:CategoriesList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAddNewCategory(context);
        },
      ),
      //  Center(child: RaisedButton(child: Text('okay'),onPressed: Add,),),
      ),
    );
  }
}
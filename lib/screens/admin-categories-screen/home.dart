import 'package:admin_test/models/category.dart';
import 'package:admin_test/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'categories-list.dart';



class AdminCategoriesScreen extends StatelessWidget {

Future Add() async
{
  await DatabaseService().updateUserData('Comic and Graphic');

}

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Categoreey>>.value(
      value: DatabaseService().categories,
          child: Scaffold(appBar: AppBar(title: Text('App'),),
      body:CategoriesList(),
      //  Center(child: RaisedButton(child: Text('okay'),onPressed: Add,),),
      ),
    );
  }
}
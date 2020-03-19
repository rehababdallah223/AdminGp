
import 'package:admin_test/models/category.dart';
import 'package:admin_test/screens/admin-categories-screen/category-tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Categoreey>>(context);
    // print(categories.documents);
    // for(var id in categories.documents)
    // {
    //   print(id.documentID);

    // }
    // for (var doc in categories.documents)
    // {
    //   print(doc['name']);
    // }

    // categories.forEach((Categoreey){
    //   print("this is Id ${Categoreey.id} , this is title ${Categoreey.title}");
    // });
    
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context,index){
        return CategoryTile(category: categories[index],);

    });
  }
}
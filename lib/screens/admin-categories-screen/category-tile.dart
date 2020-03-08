
import 'package:admin_test/models/category.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Categoreey category;
  CategoryTile({this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,6,20,0),
        child: ListTile(
          title: Text(category.title),
        ),
      ),
    );
  }
}
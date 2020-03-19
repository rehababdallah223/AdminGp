
import 'package:admin_test/common/repository.dart';
import 'package:admin_test/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';



class DatabaseService 
{
  final String uid;
  DatabaseService({this.uid});

    final Repository _categoryRepo = new Repository("categories");



  //collection refrence w hwa refrence l collection mo3in fi ll database
  final CollectionReference categoriesCollection = Firestore.instance.collection('categories');

Future updateUserData(String title) async 
{
  return await categoriesCollection.document().setData({
    'title' : title,
    
  });
}
//category list from snapshot function
List<Categoreey> _categoryListFromSnapshot(QuerySnapshot snapshot)
{
  return snapshot.documents.map((doc){
    return Categoreey(
      id: doc.documentID,
      title: doc.data['title'] ?? '',
      );
  }).toList();
}
//get categories stream 

Stream<List<Categoreey>> get categories
{
  return categoriesCollection.snapshots()
  .map(_categoryListFromSnapshot);
}

Future deleteCategory(docId) async {
    // bookCOllection.document(docId).delete();
    await _categoryRepo.removeDocument(docId);
    return;
  }

}
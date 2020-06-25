

import 'package:admin_test/common/repository.dart';
import 'package:admin_test/models/OnlineBook.dart';
import 'package:admin_test/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';




class DatabaseService 
{
  final String uid;
  DatabaseService({this.uid});

    final Repository _categoryRepo = new Repository("categories");
    final Repository _onlineBookRepo = new Repository("Online_books");





  //collection refrence w hwa refrence l collection mo3in fi ll database
  final CollectionReference categoriesCollection = Firestore.instance.collection('categories');
  final CollectionReference onlineBookCOllection = Firestore.instance.collection('Online_books');

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

Future deleteOnlineBook(docId) async {
    // bookCOllection.document(docId).delete();
    await _onlineBookRepo.removeDocument(docId);
    return;
  }

//--------------------------Add new Online bookBook-------------------------------------------
  Future updateOnlineBookData(
      
      String bookname,
      String authorname,
      var image,
      String category,
      String description,
      int price,
      int quantity,
      
      ) async {
    return await onlineBookCOllection.document().setData({
      
      'bookname': bookname,
      'authorname': authorname,
      'image': image,
      'category': category,
      'decription': description,
      'price' : price,
      'quantity' : quantity,

    });
  }    

//------------save image on fire storage------------------
  Future uploadPic(File _image) async {
    print('image path is $_image');
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
       
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    print("image uploaded on path $_image");
  }

    // get Online books stream
  Stream<List<OnlineBook>> get onlineBooks {
    return onlineBookCOllection.snapshots().map(onlinebookListFromSnapshot);
  }

//online book list from snapshot

  List<OnlineBook> onlinebookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return OnlineBook(
        documentId: doc.documentID,
        bookName: doc.data['bookname'] ?? '',
        authorName: doc.data['authorname'] ?? '',
        bookImage: doc.data['image'] ?? '',
        describtion: doc.data['decription'] ?? '',
        category: doc.data['category'] ?? '',
        price: doc.data['price'],
        quantity: doc.data['quantity'],
      );
    }).toList();
  }

}
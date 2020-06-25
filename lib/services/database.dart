import 'package:admin_test/common/repository.dart';
import 'package:admin_test/models/OnlineBook.dart';
import 'package:admin_test/models/book.dart';
import 'package:admin_test/models/category.dart';
import 'package:admin_test/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';




class DatabaseService 
{
  final String uid;
  DatabaseService({this.uid});

    final Repository _categoryRepo = new Repository("categories");
    final Repository _onlineBookRepo = new Repository("Online_books");
    final Repository _usersRepo = new Repository("users");
    final Repository _bookRepo = new Repository("books");



  //collection refrence w hwa refrence l collection mo3in fi ll database
  final CollectionReference categoriesCollection = Firestore.instance.collection('categories');
  final CollectionReference onlineBookCOllection = Firestore.instance.collection('Online_books');
  final CollectionReference usersCOllection = Firestore.instance.collection('users');
  final CollectionReference booksCOllection = Firestore.instance.collection('books');



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
    
    await _categoryRepo.removeDocument(docId);
    return;
  }

Future deleteOnlineBook(docId) async {
   
    await _onlineBookRepo.removeDocument(docId);
    return;
  }

Future deleteUser(docId) async {
    
    await _usersRepo.removeDocument(docId);
    return;
  }

Future deleteBook(docId) async {
    
    await _bookRepo.removeDocument(docId);
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
  

    // get Users stream
  Stream<List<UserDetails>> get user {
    return usersCOllection.snapshots().map(usersListFromSnapshot);
  }

//online users list from snapshot

  List<UserDetails> usersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserDetails(
        userID: doc.documentID,
        firstName: doc.data['firstname'] ?? '',
        lastName: doc.data['lastname'] ?? '',
        image: doc.data['image'] ?? '',
        phoneNumber: doc.data['phonenumber'] ?? '',
        email: doc.data['email'] ?? '',
      );
    }).toList();
  }  


      // get User books stream
  Stream<List<Book>> get books {
    return booksCOllection.snapshots().map(bookListFromSnapshot);
  }

//online user books list from snapshot

  List<Book> bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Book(
        documentId: doc.documentID,
        bookName: doc.data['bookname'] ?? '',
        authorName: doc.data['authorname'] ?? '',
        bookImage: doc.data['image'] ?? '',
        selectedCategory: doc.data['category'] ?? '',
        describtion: doc.data['decription'] ?? '',
        userName: doc.data['username'] ?? '',
      );
    }).toList();
  }  

  //-----------------------Get category List---------------------------------

  Future<List<Categoreey>> getCategories() async {
    return _categoryRepo.getDataCollection().then((doc) {
      return doc.documents
          .map((b) => Categoreey.fromSnapshot(b.data, b.documentID))
          .toList();
    });
  }

}
import 'package:admin_test/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_test/services/database.dart';
import 'dart:io';

class Authservices{

final FirebaseAuth _auth = FirebaseAuth.instance;

//---------------------------------------------------



Future getCurrentUser()async{
FirebaseUser user = await _auth.currentUser();
return user;
//print("the user id is $uid");
}

//--------get a user from firebase user----

/*User _userFromFirebaseUser(FirebaseUser user)
{
  if(user!=null)
   return User(uid: user.uid);
   else
    return null;
}*/


//---- auth change user stream---------------
/*
Stream<User> get user {
  return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
}*/

//--------Sign Out----------------------------









//-----------Add new online book---------------
Future addNewOnlineBook(String bookname,String authorname,var image,String category ,String description,var price,int quantity) async{

  
    final FirebaseUser user = await _auth.currentUser();
    
    
    await DatabaseService().updateOnlineBookData(bookname, authorname , image , category ,description,price,quantity);
return 1;
   // return _userFromFirebaseUser(user);

  /*catch(e){
    print(e.toString());
    return null;
  }*/
  }  






  
}
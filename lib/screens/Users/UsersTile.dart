
import 'package:admin_test/models/user.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';

class UsersTile extends StatelessWidget {
  final UserDetails user;
  UsersTile({this.user});

  Future deleteUser(String docId) async{
    DatabaseService service = new DatabaseService();
    await service.deleteUser(docId);
    return;
  }


  @override
    Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,6,20,0),
        child: ListTile(
          title: Text(user.firstName,),
          subtitle: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Row(children:<Widget>[
                Text('Email: '),
                Text(user.email),
              ]),
              SizedBox(height: 3,),
              Row(children:<Widget>[
                Text('Phone number: '),
                Text("${user.phoneNumber}"),
              ]),              

              
            
            ],
          ),

          trailing: IconButton(
            icon: Icon(Icons.delete,color: Colors.red,),
           onPressed: () async{
             await deleteUser(user.userID);
             },
           ) ,
        ),
      ),
    );
  }
}
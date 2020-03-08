import 'package:flutter/material.dart';

import '../dummy-data.dart';

class AdminUsersScreen extends StatefulWidget {
  @override
  _AdminUsersScreenState createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {

  void removeUser (String id)
  {

    setState(() {
      DUMMY_USERS.removeWhere((userrr){
        return userrr.id == id;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return UserItem(
              id: DUMMY_USERS[index].id,
              name: DUMMY_USERS[index].name,
              imageUrl: DUMMY_USERS[index].imageUrl,
              rate: DUMMY_USERS[index].rate,
              removeUser: removeUser,

            );
          },
          itemCount: DUMMY_USERS.length,
        ));
  }
}

class UserItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final int rate;
  final Function removeUser ;

  const UserItem({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.rate,
    @required this.removeUser
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
//          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child:
              Icon(Icons.person,size: 40,color: Colors.white,)
//            Image.network(
//              imageUrl,
//              height: 60,
//              fit: BoxFit.cover,
//            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        //--------------subtitle -----------
        subtitle: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10, top: 5),
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 28,
                )),
            Text(
              rate.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        //---------------------------
        trailing: IconButton(
          onPressed: () => removeUser(id),
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

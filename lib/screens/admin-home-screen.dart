import 'package:admin_test/screens/OnlineBooks/OnlineBookView.dart';
import 'package:flutter/material.dart';
import 'Users/UserManage.dart';
import 'admin-categories-screen/home.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              //----------users inkwell--------------
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserManage()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Theme.of(context).accentColor),
                    height: 165,
                    width: 165,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Users',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //-------------------books inkwell---------------
              InkWell(
                onTap: () {
                /*  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminBooksScreen()));*/
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80, horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Theme.of(context).accentColor),
                    height: 165,
                    width: 165,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'User Books',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                          InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OnlineBookView()));
                },

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Theme.of(context).accentColor),
                    height: 165,
                    width: 165,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Online Books',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
     SizedBox(width: 40,),

              //-----------------categories inkwell-------------
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminCategoriesScreen()));
                },

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Theme.of(context).accentColor),
                    height: 165,
                    width: 165,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.category,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:admin_test/screens/OnlineBooks/AddBook.dart';
import 'package:admin_test/screens/OnlineBooks/ListView.dart';
import 'package:flutter/material.dart';
class OnlineBookView extends StatefulWidget {
  @override
  _OnlineBookViewState createState() => _OnlineBookViewState();
}

class _OnlineBookViewState extends State<OnlineBookView> {
  @override
  Widget build(BuildContext context) {
    return 
      
          Scaffold(
        appBar:AppBar( 
          title: Text('Online Books')
          ),
        body: Center(
          child: Column(
            
            children: <Widget>[
              SizedBox(height: 50,),
                  //----------users inkwell--------------
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListViewOnlineBooks()));
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
                              'List Books',
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
                 
 SizedBox(height: 40,),

                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddOnlineBookForm()));
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
                              'Add Book',
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
        ),
      );
  }
}
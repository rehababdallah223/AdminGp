import 'dart:io';
import 'package:admin_test/models/category.dart';
import 'package:admin_test/services/Auth.dart';
import 'package:admin_test/services/database.dart';
import 'package:admin_test/services/UploadImage.dart';
import 'package:flutter/material.dart';
import 'package:admin_test/common/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:path/path.dart';

class AddOnlineBookForm extends StatefulWidget {
  FileImage get bookImage => null;

  @override
  _AddOnlineBookFormState createState() => _AddOnlineBookFormState();
}

class _AddOnlineBookFormState extends State<AddOnlineBookForm> {
  final UploadImage img = UploadImage();
  final DatabaseService _database = DatabaseService();
  final Authservices _auth = Authservices();
  final _key = GlobalKey<FormState>();
  List<String> categories = ['Action','Romance','Horror','science'];
  String bookName = '';
  String authorName = '';
  File bookImage;
  String selectedCategory = '';
  String catSelected = "Select Category";
  String describtion = '';
  int price = 0;
  int quantity = 0 ;
  bool loading = false;
  String error = '';

//---------------Controllers---------------------------------
  TextEditingController _bookNameController = TextEditingController();
  TextEditingController _authorNameController = TextEditingController();
  TextEditingController _bookImageController = TextEditingController();
  TextEditingController _bookDescriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
//----------------------------------------------------

/*
_AddOnlineBookFormState(){
  _getCategory();
}

  _getCategory() async {
    categories = await _database.getCategories();
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: 
        

            Container(
                padding: const EdgeInsets.all(70),
                child: Text(
                  'Add new Book',
                ))
          
       
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _key,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                TextFormField(
                  controller: _bookNameController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Book Name', prefixIcon: Icon(Icons.book)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Book Name';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      bookName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: _authorNameController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Author Name', prefixIcon: Icon(Icons.person)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Author Name';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      authorName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: _bookDescriptionController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Describtion',
                      prefixIcon: Icon(Icons.text_fields)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Book Describtion';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      describtion = val;
                    });
                  },
                ),

                DropdownButtonFormField(
                    validator: (val) {
                      if (val?.isEmpty ?? true) {
                        return 'Choose a category';
                      }
                      return null;
                    },
                    hint: Text(catSelected),
                    
          items: [
            DropdownMenuItem<String>(
              child: Text('Action'),
              value: 'Action',
            ),
            DropdownMenuItem<String>(
              child: Text('Romance'),
              value: 'Romance',
            ),
            DropdownMenuItem<String>(
              child: Text('Horror'),
              value: 'Horror',
            ),
            
            DropdownMenuItem<String>(
              child: Text('Science'),
              value: 'Science',
            ),
          ],
                    onChanged: (val) {
                      print(val);
                      setState(() {
                        selectedCategory = val;
                        //catSelected = categories.firstWhere((cat) => cat.id == selectedCategory).title;
                      });
                    }),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Price', prefixIcon: Icon(Icons.pages)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Price';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      price = int.parse(val);
                    });
                  },
                ),
                SizedBox(height: 18,),
              
                TextFormField(
                  controller: _quantityController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Quantity', prefixIcon: Icon(Icons.multiline_chart)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Quantity';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      quantity = int.parse(val);
                    });
                  },
                ),
                SizedBox(height: 18,),
                FlatButton(
                  onPressed: null,
                  child: Row(children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Color.fromRGBO(23, 19, 17, 10), // button color
                        child: InkWell(
                            splashColor: Color.fromRGBO(
                                240, 140, 44, 10), // inkwell color
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                            onTap: () {
                              Alert(
                                  context: context,
                                  title: 'ALert',
                                  style: AlertStyle(
                                    titleStyle: TextStyle(fontSize: 0),
                                    animationType: AnimationType.fromTop,
                                    animationDuration:
                                        Duration(milliseconds: 400),
                                  ),
                                  content: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: null,
                                            child: Row(children: <Widget>[
                                              ClipOval(
                                                child: Material(
                                                  color: Color.fromRGBO(23, 19,
                                                      17, 10), // button color
                                                  child: InkWell(
                                                      splashColor: Color.fromRGBO(
                                                          240,
                                                          140,
                                                          44,
                                                          10), // inkwell color
                                                      child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          )),
                                                      onTap: () async {
                                                        bookImage =
                                                            await UploadImage()
                                                                .OpenGallery();
                                                      }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text('Gallery',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          23, 19, 17, 10))),
                                            ]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.0),
                                      Row(
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: null,
                                            child: Row(children: <Widget>[
                                              ClipOval(
                                                child: Material(
                                                  color: Color.fromRGBO(23, 19,
                                                      17, 10), // button color
                                                  child: InkWell(
                                                      splashColor: Color.fromRGBO(
                                                          240,
                                                          140,
                                                          44,
                                                          10), // inkwell color
                                                      child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child: Icon(
                                                            Icons.camera,
                                                            color: Colors.white,
                                                          )),
                                                      onTap: () {
                                                        UploadImage()
                                                            .OpenCamera();
                                                        bookImage =
                                                            img.getter();
                                                      }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text('Camera',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          23, 19, 17, 10))),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () async {
                                        print("the path is $bookImage");
                                        await _database.uploadPic(bookImage);
                                        Navigator.pop(context, true);
                                      },
                                      color: Color.fromRGBO(23, 19, 17, 10),
                                      width: 120,
                                    ),
                                  ]).show();
                            }),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text('Upload image',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(23, 19, 17, 10))),
                  ]),
                ),
                SizedBox(
                  height: 14.0,
                ),
                RaisedButton(
                  color: Color.fromRGBO(23, 19, 17, 10),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_key.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.addNewOnlineBook(
                          bookName,
                          authorName,
                          basename(bookImage.path),
                          selectedCategory,
                          describtion,
                          price,
                          quantity);
                      
                      if (result !=1) {
                        setState(() {
                          print("false");
                          error = 'could not submit';
                          loading = false;
                        });
                      } else {
                        Alert(
                            context: context,
                            title: 'ALert',
                            style: AlertStyle(
                              titleStyle: TextStyle(fontSize: 0),
                              animationType: AnimationType.fromTop,
                              animationDuration: Duration(milliseconds: 400),
                            ),
                            content: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.warning,
                                  color: Color.fromRGBO(180, 10, 3, 2),
                                  size: 47,
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Book Added Successfuly',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(height: 9.0),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  _bookNameController.clear();
                                  _bookDescriptionController.clear();
                                  _bookImageController.clear();
                                  _bookDescriptionController.clear();
                                  _authorNameController.clear();
                                  _priceController.clear();
                                  _quantityController.clear();
                                  setState(() {
                                    selectedCategory = '';
                                    bookImage = null;
                                  });
                                  Navigator.pop(context, true);
                                },
                                color: Color.fromRGBO(23, 19, 17, 10),
                                width: 120,
                              ),
                            ]).show();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

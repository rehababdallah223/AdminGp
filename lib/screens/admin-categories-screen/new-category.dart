
import 'package:flutter/material.dart';

class NewCategory extends StatefulWidget
{
  //---------------the constructor ------------------
  final Function addNewCategory;
  NewCategory(this.addNewCategory);

  @override
  State<StatefulWidget> createState() {

    return NewCategoryState(addNewCategory);
  }

}

class NewCategoryState extends State<NewCategory>

{
  final idController = TextEditingController();
  final titleController = TextEditingController();

//------------the constructor -----------------
  Function addNewCategory;
  NewCategoryState(this.addNewCategory);

// ------------------submit function ------------------
  void submitted ()
  {
    final enterdTitle = titleController.text;

    if(enterdTitle.isEmpty )
    {
      return;
    }
    addNewCategory(enterdTitle);
    Navigator.of(context).pop();
  }
  //-----------end of submit function ----------------

//-----------widget tree ----------------------
  @override
  Widget build(BuildContext context) {
    //---------card of new transaction ----------------
    return Card(
      elevation: 5,
      //----------the container that holds the column of text fields --------------
      child: Container(
        padding: EdgeInsets.all(10),
        //----------the column of text fields --------------
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitted() ,
            ),
            
            FlatButton(
              child: Text('Add Category'),
              onPressed: submitted,
              textColor: Colors.white,
              color: Colors.blueAccent,
            )
          ],
        ),),
    );
  }
}

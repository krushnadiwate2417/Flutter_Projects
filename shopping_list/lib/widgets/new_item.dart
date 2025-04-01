



import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget{
  const NewItem({super.key});

  @override 
  State<NewItem> createState(){
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem>{

  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem(){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        GroceryItem(id: DateTime.now().toString(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text('Item Name'),
                ),
                validator: (value){
                  if(
                    value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 50 
                  ){
                    return 'Enter Item Name between 1 and 50 Characters';
                  }
                  return null;
                },
                onSaved: (value){
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Quantity')
                      ),
                      initialValue: '1',
                      validator: (value){
                        if(
                          value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! <= 0
                        ){
                          return 'Enter Proper Quantity Number';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                          children: [
                            Container(width: 14,height: 14,color: category.value.color,),
                            SizedBox(width: 6,),
                            Text(category.value.title)
                          ],
                        ))
                    ], onChanged: (value){
                      setState(() {
                      _selectedCategory = value!;
                      });
                    }),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    _formKey.currentState!.reset();
                  }, child: Text('Reset')),
                  ElevatedButton(onPressed:_saveItem, child: Text('Add Item'))
                ],
              )
            ],
          )
          ),
      ),
    );
  }
}
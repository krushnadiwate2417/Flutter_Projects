



import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';

class NewItem extends StatefulWidget{
  const NewItem({super.key});

  @override 
  State<NewItem> createState(){
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text('Item Name'),
                ),
                validator: (value){
                  return 'Demo...';
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
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category,
                          child: Row(
                          children: [
                            Container(width: 14,height: 14,color: category.value.color,),
                            SizedBox(width: 6,),
                            Text(category.value.title)
                          ],
                        ))
                    ], onChanged: (value){}),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text('Reset')),
                  ElevatedButton(onPressed: (){}, child: Text('Add Item'))
                ],
              )
            ],
          )
          ),
      ),
    );
  }
}
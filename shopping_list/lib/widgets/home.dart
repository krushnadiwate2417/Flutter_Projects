import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/new_item.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _addItem(){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewItem()));
          }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your List",
          
        ),
        actions: [
          IconButton(onPressed: _addItem, icon: Icon(Icons.add,color: Colors.white,))
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx,index)=>
           ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(width: 24,height: 24,color:groceryItems[index].category.color ,),
            trailing: Text('${groceryItems[index].quantity}',style: TextStyle(
              fontSize: 15
            ),),
           )
        )
    );
  }
}
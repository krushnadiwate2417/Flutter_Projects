import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class Home extends StatefulWidget{
  const Home({super.key});



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final List<GroceryItem> groceryItemsDynamic = [];
  void _addItem()async{
            final result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx)=>NewItem()));
            if(result == null) return;  
            setState(() {
              groceryItemsDynamic.add(result);
            });
            
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
      body: groceryItemsDynamic.isEmpty?
       Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('!! List is Empty !!',
        style: TextStyle(fontSize: 40),
       ),
       const SizedBox(height: 10,),
       Text('Try Adding Some Items...',
        style: TextStyle(fontSize: 20),
       )
        ],
       ),) 
      : ListView.builder(
        itemCount: groceryItemsDynamic.length,
        itemBuilder: (ctx,index)=>
           Dismissible(
            onDismissed: (val){
              
            },
            key: ValueKey(index),
             child: ListTile(
              title: Text(groceryItemsDynamic[index].name),
              leading: Container(width: 24,height: 24,color:groceryItemsDynamic[index].category.color ,),
              trailing: Text('${groceryItemsDynamic[index].quantity}',style: TextStyle(
                fontSize: 15
              ),),
             ),
           )
        )
    );
  }
}
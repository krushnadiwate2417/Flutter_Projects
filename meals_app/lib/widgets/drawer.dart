

import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget{
  const DrawerMain({super.key, required this.onSelectedDrawer});

  final void Function(String identifier) onSelectedDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primaryContainer,
                        Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            ),
          child: Row(children: [
              Icon(Icons.fastfood,size: 48,color: Theme.of(context).colorScheme.primary,),
              SizedBox(width: 18),
              Text("Cooking Up", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color:  Theme.of(context).colorScheme.primary
              ),)
            ],
          )),
          ListTile(
            onTap: (){onSelectedDrawer("meals");},
            leading: Icon(Icons.restaurant,size: 24,color: Theme.of(context).colorScheme.onPrimaryContainer,),
            title: Text("Meals",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color:  Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 24
              ),),
          ),
          ListTile(
            onTap: (){onSelectedDrawer("filter");},
            leading: Icon(Icons.filter_alt_outlined,size: 24,color: Theme.of(context).colorScheme.onPrimaryContainer,),
            title: Text("Filter",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color:  Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 24
              ),),
          ),
          
        ],
        
      ),
    );
  }

}


import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget{

  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<ExpenseForm>{
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
      child: Column(
        children:[
          TextField(
            controller: _titleController,
            maxLength: 25,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(children: [
            ElevatedButton(onPressed: (){
              print(_titleController.text);
            }, child: Text("Add Expense"))
          ],)
        ],
      ),
    );
  }
}
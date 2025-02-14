import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override 
  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
       title: 'Flutter Course',
       amount: 499, 
       date: DateTime.now(), 
       category: Category.work
       ),
    Expense(
       title: 'Movie',
       amount: 200, 
       date: DateTime.now(), 
       category: Category.leisure
       ),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx)=>ExpenseForm(),);
  }

  @override 
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Text('The Chart'),
          Expanded(child: ExpensesList(expenseList: _registeredExpenses)) 
        ],
      ),
    );
  }
}
import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

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

  void _addExpense(Expense expense){
    setState(() {
    _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){

    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration:const Duration(seconds: 3),
        content:const Text('Expense Deleted'),
        action: SnackBarAction(label: "Undo", onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        }),
        )
      );
  }

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      context: context, 
      builder: (ctx)=>ExpenseForm(onAddExpense: _addExpense,),
      isScrollControlled: true,
      );
  }

  @override 
  Widget build(context){
    Widget mainContent = Center(child: Text('No Expenses Found.'),);

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(expenseList: _registeredExpenses,onRemoveExpense: _removeExpense,);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent ) 
        ],
      ),
    );
  }
}
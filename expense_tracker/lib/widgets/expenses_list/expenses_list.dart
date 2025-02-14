import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,required this.expenseList,});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: expenseList.length,
    itemBuilder: (ctx,index) => ExpensesItem(expenseList[index]),
    );
  }
}
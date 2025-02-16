
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,required this.expenseList,required this.onRemoveExpense});

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: expenseList.length,
    itemBuilder: (ctx,index) => Dismissible(
      background: Container(
        color: Theme.of(context).colorScheme.error,
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
      key: ValueKey(expenseList[index]),
      onDismissed: (direction) {
        onRemoveExpense(expenseList[index]);
      },
      child: ExpensesItem(expenseList[index])),
    );
  }
}
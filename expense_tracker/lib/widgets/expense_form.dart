import 'package:expense_tracker/models/expense.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


final dateFormatter = DateFormat.yMd();

class ExpenseForm extends StatefulWidget{

  const ExpenseForm({super.key,required this.onAddExpense});

  final void Function(Expense expense) onAddExpense; 

  @override
  State<ExpenseForm> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<ExpenseForm>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.leisure;

  DateTime? _datePicked ;
  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context, 
      firstDate: DateTime(2024), 
      lastDate: DateTime.now(),
      );
      //dateFormatter.format(pickedDate);
      setState(() {
        _datePicked = pickedDate;
      });
  }

  void _submitExpenseForm(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if(_titleController.text.trim().isEmpty || amountIsInvalid || _datePicked == null){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: const Text("Invalid Input"),
        content : const Text('Valid Title,Amount & Date Required'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: Text('Okay'))
        ],
      ));
      return;
    }

    widget.onAddExpense(Expense(
      title: _titleController.text, 
      amount: enteredAmount, 
      date: _datePicked!, 
      category: _selectedCategory
    ));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(16,48,16,16),
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
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefix: Text('Rs. '),
                  
                  label: Text("Amount")
                ),
              ),
            ),
            // Expanded(
            //   child: TextField(
            //     keyboardType: TextInputType.datetime,
            //     decoration: InputDecoration(
            //       label: Text("Date")
            //     ),
            //   ),
            // ),
            const SizedBox(width: 16,),
            Expanded(
              child :Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text(_datePicked == null ? 'No date Selected':formatter.format(_datePicked!)),
                IconButton(onPressed: _presentDatePicker, icon: Icon(Icons.calendar_month))
              ],))
          ],),
          const SizedBox(height: 16,),
        Row(children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values.map((category)=> DropdownMenuItem(
                value: category,
                child: Text(category.name.toUpperCase()),)).toList(), 
              onChanged: (value){
                if(value == null){return;}
                setState(() {
                  _selectedCategory = value;
                });
            }),
            const Spacer(),
            ElevatedButton(onPressed: _submitExpenseForm, child: Text("Add Expense")),
            TextButton(onPressed: (){
             Navigator.pop(context);
            }, child: Text("Cancel"))
          ],),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime? selectedDate;

  void presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1 , now.month , now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now,
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    prefixText: "\$ ",
                    labelText: "Amount",
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null ?
                    "No Date Selected" :
                    formatter.format(selectedDate!)
                      ,),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon:Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  print(titleController.text);
                },
                child: Text(
                  "Save Expense",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

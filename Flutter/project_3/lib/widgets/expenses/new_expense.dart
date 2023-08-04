import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project3/models/expense.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

final date_formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  
  final void Function(Expense newx) addExpense;

  const NewExpense({required this.addExpense, super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    // otherwise it won't be deleted and occupies memory even when the widget is
    // not on display.
    super.dispose();
  }

  // var _enteredTitle = ''; // alternate to this method is to use Controller as shown above

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  void _datePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 3, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  // void _datePicker() async {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year - 3, now.month, now.day);

  //   final pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: firstDate,
  //     lastDate: now,
  //   );
  //   setState(() {
  //     _selectedDate = pickedDate;
  //   });
  // }

  void _submitExpenseData() {
    final double? enteredAmount = double.tryParse(_amountController.text);

    final amountIsInvalid = (enteredAmount == null) || (enteredAmount <= 0);

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure amount, title or date is entered correctly!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('okay'),
                  ),
                ],
              ));
    } else {
      setState(() {
        Expense newx = Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory,
        );
        widget.addExpense(newx);
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Title
          TextField(
            controller: _titleController,
            // onChanged: _saveTitleInput,
            maxLength: 50,
            keyboardType: TextInputType.text, // as its a Text input
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          // Amount , Date Picker
          Row(
            children: [
              Expanded(
                // because TextField also tries to take as much as horizontal space as available just like a row ( so row inside a row conflict)
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefix: Text('₹ '),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(_selectedDate == null
                  ? 'No date Selected'
                  : date_formatter.format(_selectedDate!)),
              IconButton(
                onPressed: _datePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),

          //Category Dropdown , Cancel , Save
          Row(
            children: [
              DropdownButton2(
                dropdownDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(14)),
                value: _selectedCategory, // placeholder value
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toString(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

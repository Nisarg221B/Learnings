import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_7/data/categories.dart';
import 'package:project_7/models/category.dart';
import 'package:project_7/models/grocery_item.dart';
import 'package:project_7/providers/grocery_list_provider.dart';

class NewItem extends ConsumerStatefulWidget {
  const NewItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends ConsumerState<NewItem> {
  final _formkey = GlobalKey<FormState>();

  String _enteredName = '';
  int _enteredQuantity = 1;
  bool _isSaving = false;
  Category _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      setState(() {
        _isSaving = true;
      });
      await ref.read(groceryListProvider.notifier).addItems(
            GroceryItem(
              id: DateTime.now().toString(),
              name: _enteredName,
              quantity: _enteredQuantity,
              category: _selectedCategory,
            ),
          );
      
      _isSaving = false;
      if (!context.mounted) {
        return;
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // Item name
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  // not available in TextField
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'mull be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),

              // Item quantity and Category dropdown
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Item quantity
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        // not available in TextField
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'must be a valid positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),

                  const SizedBox(
                    width: 8,
                  ),

                  // Category Dropdwon
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 12,
              ),

              // Save and reset button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSaving == true
                        ? null
                        : () {
                            _formkey.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed:
                        _isSaving == true ? null : _saveItem,
                    child: _isSaving
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Add item'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

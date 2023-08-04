import 'package:flutter/material.dart';
import 'package:project3/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height:16),
            Row(
              children: [
                Text(
                  '₹${expense.amount.toStringAsFixed(2)}', // 12.3345 = 12.33 (fixed to 2 decimal places)
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 4,),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

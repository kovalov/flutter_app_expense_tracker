import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/expense_controller.dart';
import 'expense_list_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ExpenseProvider>(
        builder: (context, expenseProvider, child) {
          return ListView.builder(
            itemCount: expenseProvider.items.length,
            itemBuilder: (context, index) {
              final item = expenseProvider.items[index];
              return ExpenseListItem(item: item);
            },
          );
        },
      ),
    );
  }
}

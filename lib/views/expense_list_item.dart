import 'package:flutter/material.dart';
import 'package:flutter_app_expense_tracker/controllers/expense_controller.dart';
import 'package:flutter_app_expense_tracker/models/expense_item.dart';
import 'package:flutter_app_expense_tracker/utils/icon_utils.dart';
import 'package:provider/provider.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({
    super.key,
    required this.item,
  });

  final ExpenseItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        getIconForCategory(item.category),
        size: 32,
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "\$${item.amount.toStringAsFixed(0)}",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          final expenseProvider =
              Provider.of<ExpenseProvider>(context, listen: false);
          expenseProvider.removeExpense(item.id!);
        },
        icon: const Icon(
          Icons.remove_circle_outline,
          size: 32,
        ),
      ),
    );
  }
}

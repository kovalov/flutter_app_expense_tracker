import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/expense_controller.dart';
import 'expense_card.dart';

class ExpenseCardGrid extends StatelessWidget {
  const ExpenseCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child) {
        return Column(
          children: [
            ExpenseCard(
              title: "Balance",
              icon: Icons.wallet,
              value: expenseProvider.currentBalance,
            ),
            Row(
              children: [
                Expanded(
                  child: ExpenseCard(
                    title: "Expense",
                    icon: Icons.arrow_circle_up,
                    value: expenseProvider.totalExpense,
                  ),
                ),
                Expanded(
                  child: ExpenseCard(
                    title: "Income",
                    icon: Icons.arrow_circle_down,
                    value: expenseProvider.totalIncome,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

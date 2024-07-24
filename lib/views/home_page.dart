import 'package:flutter/material.dart';
import 'package:flutter_app_expense_tracker/views/add_transaction_bottom_sheet.dart';
import 'package:flutter_app_expense_tracker/views/expense_card_grid.dart';
import 'package:flutter_app_expense_tracker/views/expense_list.dart';
import 'package:flutter_app_expense_tracker/views/full_width_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const ExpenseCardGrid(),
            const ExpenseList(),
            FullWidthButton(
              title: "Add transaction",
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const AddTransactionBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

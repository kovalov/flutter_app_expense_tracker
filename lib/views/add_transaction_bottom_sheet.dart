import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/expense_controller.dart';
import '../utils/enums.dart';
import 'my_text_field.dart';
import 'full_width_button.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  const AddTransactionBottomSheet({super.key});

  @override
  _AddTransactionBottomSheetState createState() =>
      _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
  ExpenseType? _selectedType;
  ExpenseCategory? _selectedCategory;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add Transaction",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<ExpenseType>(
            value: _selectedType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Type',
            ),
            items: ExpenseType.values
                .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type.name),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedType = value;
              });
            },
          ),
          const SizedBox(height: 16),
          MyTextField(
            labelText: "Amount",
            controller: _amountController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          MyTextField(
            labelText: "Title",
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<ExpenseCategory>(
            value:
                _selectedType == ExpenseType.income ? null : _selectedCategory,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Category',
            ),
            items: ExpenseCategory.values
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    ))
                .toList(),
            onChanged: _selectedType == ExpenseType.income
                ? null
                : (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
          ),
          const SizedBox(height: 32),
          FullWidthButton(
            onTap: () {
              expenseProvider.addExpense(
                title: _titleController.text,
                type: _selectedType!,
                amount: double.tryParse(_amountController.text) ?? 0,
                category: _selectedCategory,
              );
              Navigator.pop(context);
            },
            title: "Submit",
          ),
        ],
      ),
    );
  }
}

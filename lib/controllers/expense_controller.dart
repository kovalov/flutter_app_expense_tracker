import 'package:flutter/material.dart';
import 'package:flutter_app_expense_tracker/services/expense_db_service.dart';
import '../models/expense_item.dart';
import '../utils/enums.dart';

class ExpenseProvider with ChangeNotifier {
  final ExpenseDbService _dbService = ExpenseDbService();
  List<ExpenseItem> _items = [];

  List<ExpenseItem> get items => _items;

  double get totalIncome {
    return _items
        .where((item) => item.type == ExpenseType.income)
        .fold(0, (sum, item) => sum + item.amount);
  }

  double get totalExpense {
    return _items
        .where((item) => item.type == ExpenseType.expense)
        .fold(0, (sum, item) => sum + item.amount);
  }

  double get currentBalance {
    return totalIncome - totalExpense;
  }

  Future<void> loadExpenses() async {
    _items = await _dbService.getExpenses();
    notifyListeners();
  }

  Future<void> addExpense({
    required String title,
    required ExpenseType type,
    ExpenseCategory? category,
    required double amount,
  }) async {
    final expenseItem = ExpenseItem(
      title: title,
      type: type,
      amount: amount,
      category: category,
    );

    await _dbService.insertExpense(expenseItem);
    await loadExpenses();
  }

  Future<void> removeExpense(int id) async {
    await _dbService.deleteExpense(id);
    await loadExpenses();
  }
}

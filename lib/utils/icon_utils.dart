import 'package:flutter/material.dart';
import 'package:flutter_app_expense_tracker/utils/enums.dart';

Map<ExpenseCategory, IconData> categoryIcons = {
  ExpenseCategory.food: Icons.fastfood,
  ExpenseCategory.shopping: Icons.shopping_cart,
  ExpenseCategory.transportation: Icons.directions_car,
  ExpenseCategory.heatlh: Icons.local_hospital,
  ExpenseCategory.utilities: Icons.lightbulb,
  ExpenseCategory.entertainment: Icons.movie,
  ExpenseCategory.other: Icons.more_horiz,
};

IconData getIconForCategory(ExpenseCategory? category) {
  if (category == null) return Icons.attach_money; // Default icon for income
  return categoryIcons[category] ?? Icons.more_horiz;
}

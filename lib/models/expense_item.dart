import '../utils/enums.dart';

class ExpenseItem {
  final int? id;
  final String title;
  final ExpenseType type;
  final ExpenseCategory? category;
  final double amount;

  ExpenseItem({
    this.id,
    required this.title,
    required this.type,
    required this.amount,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type.index,
      'category': category?.index,
      'amount': amount,
    };
  }

  factory ExpenseItem.fromMap(Map<String, dynamic> map) {
    return ExpenseItem(
      id: map['id'],
      title: map['title'],
      type: ExpenseType.values[map['type']],
      category: map['category'] != null
          ? ExpenseCategory.values[map['category']]
          : null,
      amount: map['amount'],
    );
  }
}

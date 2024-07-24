import 'package:flutter_app_expense_tracker/models/expense_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ExpenseDbService {
  static final ExpenseDbService _instance = ExpenseDbService._internal();
  static Database? _database;

  factory ExpenseDbService() {
    return _instance;
  }

  ExpenseDbService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'expense_tracker.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, type INTEGER, category INTEGER, amount REAL)',
        );
      },
    );
  }

  Future<void> insertExpense(ExpenseItem expense) async {
    final db = await database;
    await db.insert('expenses', expense.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ExpenseItem>> getExpenses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('expenses');

    return List.generate(maps.length, (i) {
      return ExpenseItem.fromMap(maps[i]);
    });
  }

  Future<void> deleteExpense(int id) async {
    final db = await database;
    await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }
}

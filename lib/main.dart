// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MainApp());
// }

// final themeData = ThemeData(
//   primarySwatch: Colors.blue,
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: Colors.blue,
//   ),
// );

// final providers = [
//   ChangeNotifierProvider<ExpenseProvider>(
//     create: (context) => ExpenseProvider(),
//   ),
// ];

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: providers,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: themeData,
//         home: const HomePage(),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expense Tracker"),
//         forceMaterialTransparency: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Column(
//           children: [
//             const ExpenseCardGrid(),
//             const ExpenseList(),
//             FullWidthButton(
//               title: "Add transaction",
//               onTap: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return const AddTransactionBottomSheet();
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ExpenseCardGrid extends StatelessWidget {
//   const ExpenseCardGrid({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ExpenseProvider>(
//       builder: (context, expenseProvider, child) {
//         return Column(
//           children: [
//             ExpenseCard(
//               title: "Balance",
//               icon: Icons.wallet,
//               value: expenseProvider.currentBalance,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: ExpenseCard(
//                     title: "Expense",
//                     icon: Icons.arrow_circle_up,
//                     value: expenseProvider.totalExpense,
//                   ),
//                 ),
//                 Expanded(
//                   child: ExpenseCard(
//                     title: "Income",
//                     icon: Icons.arrow_circle_down,
//                     value: expenseProvider.totalIncome,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class ExpenseCard extends StatelessWidget {
//   const ExpenseCard({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.value,
//   });

//   final String title;
//   final IconData icon;
//   final double value;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "\$${value.toStringAsFixed(0)}",
//               style: const TextStyle(
//                 fontSize: 24,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Icon(
//                   icon,
//                   size: 32,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ExpenseList extends StatelessWidget {
//   const ExpenseList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Consumer<ExpenseProvider>(
//         builder: (context, expenseProvider, child) {
//           return ListView.builder(
//             itemCount: expenseProvider.items.length,
//             itemBuilder: (context, index) {
//               final item = expenseProvider.items[index];
//               return ExpenseListItem(item: item);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ExpenseListItem extends StatelessWidget {
//   const ExpenseListItem({
//     super.key,
//     required this.item,
//   });

//   final ExpenseItem item;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const Icon(
//         Icons.food_bank,
//         size: 32,
//       ),
//       title: Text(
//         item.title,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       subtitle: Text(
//         "\$${item.amount.toStringAsFixed(0)}",
//         style: const TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       trailing: IconButton(
//         onPressed: () {},
//         icon: const Icon(
//           Icons.remove_circle_outline,
//           size: 32,
//         ),
//       ),
//     );
//   }
// }

// class FullWidthButton extends StatelessWidget {
//   const FullWidthButton({
//     super.key,
//     required this.onTap,
//     required this.title,
//   });

//   final void Function() onTap;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primary,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: const EdgeInsets.all(16),
//         margin: const EdgeInsets.only(bottom: 48),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.onPrimary,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AddTransactionBottomSheet extends StatefulWidget {
//   const AddTransactionBottomSheet({super.key});

//   @override
//   _AddTransactionBottomSheetState createState() =>
//       _AddTransactionBottomSheetState();
// }

// class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
//   ExpenseType? _selectedType;
//   ExpenseCategory? _selectedCategory;
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final expenseProvider = Provider.of<ExpenseProvider>(context);

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8, 16, 8, 40),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             "Add Transaction",
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 16),
//           DropdownButtonFormField<ExpenseType>(
//             value: _selectedType,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Type',
//             ),
//             items: ExpenseType.values
//                 .map((type) => DropdownMenuItem(
//                       value: type,
//                       child: Text(type.name),
//                     ))
//                 .toList(),
//             onChanged: (value) {
//               setState(() {
//                 _selectedType = value;
//               });
//             },
//           ),
//           const SizedBox(height: 16),
//           MyTextField(
//             labelText: "Amount",
//             controller: _amountController,
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: 16),
//           MyTextField(
//             labelText: "Title",
//             controller: _titleController,
//           ),
//           const SizedBox(height: 16),
//           DropdownButtonFormField<ExpenseCategory>(
//               value: _selectedType == ExpenseType.income
//                   ? null
//                   : _selectedCategory,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Category',
//               ),
//               items: ExpenseCategory.values
//                   .map((category) => DropdownMenuItem(
//                         value: category,
//                         child: Text(category.name),
//                       ))
//                   .toList(),
//               onChanged: _selectedType == ExpenseType.income
//                   ? null
//                   : (value) {
//                       setState(() {
//                         _selectedCategory = value;
//                       });
//                     }),
//           const SizedBox(height: 32),
//           FullWidthButton(
//             onTap: () {
//               expenseProvider.addExpense(
//                 title: _titleController.text,
//                 type: _selectedType!,
//                 amount: double.tryParse(_amountController.text) ?? 0,
//                 category: _selectedCategory,
//               );
//               Navigator.pop(context);
//             },
//             title: "Submit",
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyTextField extends StatelessWidget {
//   const MyTextField({
//     super.key,
//     required this.controller,
//     required this.labelText,
//     this.keyboardType,
//   });

//   final TextEditingController controller;
//   final String labelText;
//   final TextInputType? keyboardType;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(),
//         labelText: labelText,
//       ),
//       keyboardType: keyboardType ?? TextInputType.text,
//     );
//   }
// }

// enum ExpenseType {
//   expense,
//   income,
// }

// enum ExpenseCategory {
//   food,
//   shopping,
//   transportation,
//   heatlh,
//   utilities,
//   entertainment,
//   other
// }

// class ExpenseItem {
//   final String title;
//   final ExpenseType type;
//   final ExpenseCategory? category;
//   final double amount;

//   ExpenseItem({
//     required this.title,
//     required this.type,
//     required this.amount,
//     this.category,
//   });
// }

// class ExpenseProvider extends ChangeNotifier {
//   final List<ExpenseItem> _items = [
//     ExpenseItem(
//       title: "Apple",
//       type: ExpenseType.expense,
//       category: ExpenseCategory.food,
//       amount: 16,
//     ),
//     ExpenseItem(
//       title: "Income",
//       type: ExpenseType.income,
//       amount: 2000,
//     ),
//   ];

//   List<ExpenseItem> get items => _items;

//   double get totalIncome {
//     return _items
//         .where((item) => item.type == ExpenseType.income)
//         .fold(0, (sum, item) => sum + item.amount);
//   }

//   double get totalExpense {
//     return _items
//         .where((item) => item.type == ExpenseType.expense)
//         .fold(0, (sum, item) => sum + item.amount);
//   }

//   double get currentBalance {
//     return totalIncome - totalExpense;
//   }

//   void addExpense({
//     required String title,
//     required ExpenseType type,
//     ExpenseCategory? category,
//     required double amount,
//   }) {
//     final expenseItem = ExpenseItem(
//       title: title,
//       type: type,
//       amount: amount,
//       category: category,
//     );

//     _items.add(expenseItem);
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_app_expense_tracker/theme/light_theme.dart';
import 'package:provider/provider.dart';
import 'controllers/expense_controller.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExpenseProvider>(
          create: (context) => ExpenseProvider()..loadExpenses(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}

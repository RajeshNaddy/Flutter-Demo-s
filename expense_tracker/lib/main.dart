import './widgets/new_transactions.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/widgets.dart';

import 'models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense tracker'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              color: Colors.blue,
              child: Container(
                child: Text('CHart'),
                width: double.infinity,
              ),
              elevation: 5,
            ),
            NewTransactions(),
            TransactionList()
          ],
        ),
      ),
    );
  }
}

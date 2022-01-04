import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

import './widgets/new_transactions.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/widgets.dart';

import 'models/transaction.dart';
import 'package:flutter/material.dart';
import './widgets/chart.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      primarySwatch: Colors.purple,
      accentColor: Colors.amber,
      fontFamily: 'Quicksand',
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // late String titleInput;
  // late String amountInput;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> userTransactions = [
    // Transaction(id: 'id1', name: "Shoes", amount: 99.0, date: DateTime.now()),
    // Transaction(id: 'id2', name: "Socks", amount: 12.0, date: DateTime.now())
  ];

  void _addNewTransactions(String name, double amount) {
    final Transaction newTxn = Transaction(
        id: DateTime.now().toString(),
        name: name,
        amount: amount,
        date: DateTime.now());
    //userTransactions.add(newTxn);

    setState(() {
      userTransactions.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransactions(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                startAddNewTransactions(context);
              },
              icon: Icon(Icons.add))
        ],
        title: const Text(
          'Expense tracker',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            TransactionList(userTransactions)
          ],
        ),
      ),
    );
  }

  List<Transaction> get _recentTransactions {
    return userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            child: NewTransactions(_addNewTransactions),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }
}

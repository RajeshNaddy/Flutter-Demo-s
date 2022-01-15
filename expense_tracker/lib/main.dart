import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18),
            button: TextStyle(color: Colors.white)),
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        errorColor: Colors.red),
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

  void _addNewTransactions(String name, double amount, DateTime dateSelected) {
    final Transaction newTxn = Transaction(
        id: DateTime.now().toString(),
        name: name,
        amount: amount,
        date: dateSelected);
    //userTransactions.add(newTxn);

    setState(() {
      userTransactions.add(newTxn);
    });
  }

  void deleteTransactions(String id) {
    setState(() {
      userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
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
            fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );

    return Scaffold(
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                startAddNewTransactions(context);
              },
              child: Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Show Chart'),
                    Switch.adaptive(
                        value: showChart,
                        onChanged: (bool) {
                          setState(() {
                            showChart = bool;
                          });
                        })
                  ],
                ),
              if (!isLandscape)
                Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.3,
                    child: Chart(_recentTransactions)),
              if (!isLandscape)
                Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.75,
                    child:
                        TransactionList(userTransactions, deleteTransactions)),
              if (isLandscape)
                showChart
                    ? Container(
                        height: (mediaQuery.size.height -
                                appBar.preferredSize.height -
                                mediaQuery.padding.top) *
                            0.7,
                        child: Chart(_recentTransactions))
                    : Container(
                        height: (mediaQuery.size.height -
                                appBar.preferredSize.height -
                                mediaQuery.padding.top) *
                            0.75,
                        child: TransactionList(
                            userTransactions, deleteTransactions))
            ],
          ),
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

  bool showChart = false;
}

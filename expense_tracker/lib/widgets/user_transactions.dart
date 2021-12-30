import 'package:flutter/material.dart';
import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<Transaction> userTransactions = [
    Transaction(id: 'id1', name: "Shoes", amount: 99.0, date: DateTime.now()),
    Transaction(id: 'id2', name: "Socks", amount: 12.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransactions(), TransactionList(userTransactions)],
    );
  }

  void addNewTransactions(String name, double amount) {
    final Transaction newTxn = Transaction(
        id: DateTime.now().toString(),
        name: name,
        amount: amount,
        date: DateTime.now());
    userTransactions.add(newTxn);
  }
}

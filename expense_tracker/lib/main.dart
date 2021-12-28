import 'package:flutter/widgets.dart';

import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(id: 'id1', name: "Shoes", amount: 99.0, date: DateTime.now()),
    Transaction(id: 'id2', name: "Socks", amount: 12.0, date: DateTime.now())
  ];
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
            Card(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(),
                    TextField(),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions
                  .map((e) => Card(
                          child: Row(
                        children: [
                          Container(
                            child: Text('\$${e.amount}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple)),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2)),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.yMMMEd().format(e.date),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      )))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

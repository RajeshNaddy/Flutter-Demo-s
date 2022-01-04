import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 100,
                    child: Image.asset("assets/images/waiting.png",
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor)),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(transactions[index].date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              },
              itemCount: transactions.length,
            ),
    );
    // child: Column(
    //   children: transactions
    //       .map((e) => Card(
    //               child: Row(
    //             children: [
    //               Container(
    //                 child: Text('\$${e.amount}',
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20,
    //                         color: Colors.purple)),
    //                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //                 decoration: BoxDecoration(
    //                     border: Border.all(color: Colors.purple, width: 2)),
    //                 padding: EdgeInsets.all(10),
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     e.name,
    //                     style: TextStyle(
    //                         fontSize: 16, fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     DateFormat.yMMMEd().format(e.date),
    //                     style: TextStyle(color: Colors.grey),
    //                   )
    //                 ],
    //               )
    //             ],
    //           )))
    //       .toList(),
    // ),
  }
}

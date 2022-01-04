import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var sum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          sum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(sum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionsValues.map((data) {
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}

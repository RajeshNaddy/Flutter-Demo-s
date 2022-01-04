import 'package:flutter/material.dart';

class Transaction {
  final String id;
  String name;
  double amount;
  DateTime date;

  Transaction(
      {@required this.id,
      @required this.name,
      @required this.amount,
      @required this.date});
}

import 'package:flutter/material.dart';
import '../providers/orders.dart' as oi;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  oi.OrderItem orderItem;

  OrderItem(this.orderItem);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orderItem.amount}'),
            subtitle: Text(
                '${DateFormat('dd MM yyyy hh:mm').format(widget.orderItem.dateTime)}'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.orderItem.products.length * 20.0, 180),
              child: ListView(
                children: widget.orderItem.products
                    .map((product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(product.title),
                            Text('${product.quantity} x \$${product.price}')
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}

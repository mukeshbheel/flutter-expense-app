import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transactions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> transactions = [
    Transactions(
      id: '1',
      title: 'Buy Clothes',
      amount: 32.01,
      date: DateTime.now(),
    ),
    Transactions(
      id: '1',
      title: 'Buy Shoes',
      amount: 32.01,
      date: DateTime.now(),
    ),
  ];

  void addnewTransaction(String title, String amount) {
    setState(() {
      transactions.add(new Transactions(
          id: (transactions.length + 1).toString(),
          title: title,
          amount: double.parse(amount),
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('status'),
                  elevation: 5,
                ),
              ),
              NewTransaction(addnewTransaction),
              TransactionList(transactions),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

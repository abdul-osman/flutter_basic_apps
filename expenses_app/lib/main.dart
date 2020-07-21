import 'package:flutter/material.dart';
import 'transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Expenses App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 19.99,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Transaction List'),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return
                  // Card(child: Text(tx.title));
                  ListTile(
                leading: Text(
                  tx.amount.toString(),
                  textAlign: TextAlign.center,
                ),
                title: Text(tx.title),
                subtitle: Text(tx.date.toString()),
                trailing: Icon(Icons.delete),
              );
            }).toList(),
          ),
          Column(
            children: transactions.map((tx) {
              return Column(
                children: <Widget>[
                  Text(
                    '${tx.amount}',
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    tx.date.toString(),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function fnDeleteTx;

  TransactionList({this.transactions, this.fnDeleteTx});

  @override
  Widget build(BuildContext context) {
    return  transactions.isEmpty
          ? LayoutBuilder(
            builder: (ctx, constraints){
              return  Column(
              children: <Widget>[
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
            },
          )
         
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child:
                                  Text('R\$ ${transactions[index].amount}'))),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => fnDeleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
           
    );
  }
}

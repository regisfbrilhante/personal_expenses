import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmmount;
  final double spendingPctOfTotal;

  ChartBar({this.label, this.spendingAmmount, this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('R\$ ${spendingAmmount.toStringAsFixed(0)}'),
        SizedBox(height: 4,),
        Container(
          height: ,
        )
      ],
    );
  }
}

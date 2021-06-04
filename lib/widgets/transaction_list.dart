import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';

import 'transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransactionHandler;
  TransactionList(this._transactions, this._deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (context, constriants) {
            return Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: constriants.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionListItem(
                transaction : _transactions[index],
                deleteTransactionHandler: _deleteTransactionHandler,
              );
              // return Card(
              //   color: Theme.of(context).scaffoldBackgroundColor,
              //   child: Row(
              //     children: [
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //           color: Theme.of(context).primaryColor,
              //           width: 2,
              //         )),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\u{20B9}${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transactions[index].title,
              //             style: TextStyle(
              //               color: Colors.grey,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15,
              //             ),
              //           ),
              //           Text(
              //             DateFormat.yMMMd().format(transactions[index].date),
              //             style: TextStyle(
              //               color: Colors.blueGrey,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 10,
              //             ),
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // );
            },
            itemCount: _transactions.length,
          );
  }
}

import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key key,
    @required Transaction transaction,
    @required Function deleteTransactionHandler,
  })  : _transaction = transaction,
        _deleteTransactionHandler = deleteTransactionHandler,
        super(key: key);

  final Transaction _transaction;
  final Function _deleteTransactionHandler;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\u{20B9}${_transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 300
            ? TextButton.icon(
                onPressed: () => _deleteTransactionHandler(_transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                style: TextButton.styleFrom(primary: Colors.red),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => _deleteTransactionHandler(_transaction.id),
              ),
      ),
    );
  }
}

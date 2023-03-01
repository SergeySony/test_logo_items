import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final int itemIndex;

  const ItemTile(
      this.itemIndex, {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          side:  BorderSide(color: Colors.black, width: 2),
        ),
        title: Text(
          'Item${itemIndex+1}',
          textAlign: TextAlign.center,
          key: Key('text_$itemIndex'),
        ),
      ),
    );
  }
}
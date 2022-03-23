import 'package:flutter/material.dart';
import 'package:shoppinglist/schemas/item.dart';

class ItemListView extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onToggle;
  final Function(Item) onDelete;
  const ItemListView(
      {Key? key,
      required this.items,
      required this.onToggle,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemBuilder: getItemBuilder,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: getSeparatorBuilder,
        itemCount: items.length);
  }

  Widget getItemBuilder(BuildContext context, int index) {
    Item item = items[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Checkbox(
              value: item.done, onChanged: (bool? value) => {onToggle(item)}),
          Text(item.text,
              style: TextStyle(
                  decorationColor: Colors.indigo,
                  decorationThickness: 2,
                  fontSize: 20,
                  decoration: getTextDecoration(item.done)))
        ]),
        IconButton(
            onPressed: () => {onDelete(item)},
            icon: Icon(
              Icons.delete,
              color: Colors.indigo,
              size: 25,
              semanticLabel: 'Delete ${item.text}',
            ))
      ],
    );
  }

  Widget getSeparatorBuilder(BuildContext context, int index) {
    return const Divider(
      thickness: 1,
      color: Colors.indigo,
    );
  }

  TextDecoration getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : TextDecoration.none;
  }
}

import 'package:flutter/cupertino.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container();
          },
        );
      },
    );
  }
}

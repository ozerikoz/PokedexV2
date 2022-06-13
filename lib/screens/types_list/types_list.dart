import 'package:flutter/material.dart';

class TypeList extends StatefulWidget {
  const TypeList({Key? key}) : super(key: key);

  @override
  State<TypeList> createState() => _TypeListState();
}

class _TypeListState extends State<TypeList> {
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

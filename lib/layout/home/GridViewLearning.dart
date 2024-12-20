import 'package:flutter/material.dart';

class Gridviewlearning extends StatelessWidget {
  const Gridviewlearning({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listsData = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
    return GridView.builder(
      itemCount: listsData.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Card.filled(
          color: Colors.lightBlue,
          child: Center(
            child: Text(listsData[index]),
          ),
        );
      },
    );
  }
}
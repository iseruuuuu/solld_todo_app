import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You Search Images',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}

class NoScreen extends StatelessWidget {
  const NoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No Result',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}

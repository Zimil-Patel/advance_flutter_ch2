import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Chapter2());
}

class Chapter2 extends StatelessWidget {
  const Chapter2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      builder: (context, child) {
        return const MaterialApp();
      },
    );
  }
}

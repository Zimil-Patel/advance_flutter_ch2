import 'package:advance_flutter_ch2/api%20call%20example/provider/user_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api call example/api_calling_example.dart';

void main() {
  runApp(const Chapter2());
}

class Chapter2 extends StatelessWidget {
  const Chapter2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserApiProvider(),),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ApiCallingExample(),
        );
      },
    );
  }
}

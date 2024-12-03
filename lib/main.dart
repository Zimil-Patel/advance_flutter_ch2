import 'package:advance_flutter_ch2/api%20call%20example/provider/user_api_provider.dart';
import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/pixabay_api_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {

  // Set the status bar icon color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness: Brightness.dark, // Light icons
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  UserApiProvider userApiProvider = UserApiProvider();
  userApiProvider.fetchUserApiRecords();
  PixabayApiProvider pixabayApiProvider = PixabayApiProvider();
  pixabayApiProvider.fetchPixabayRecords();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => userApiProvider,
          ),
          ChangeNotifierProvider(
            create: (context) => pixabayApiProvider,
          ),
        ],
        builder: (context, child) {
          return const Chapter2();
        }),
  );
}

class Chapter2 extends StatelessWidget {
  const Chapter2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PixabayApiExample(),
    );
  }
}

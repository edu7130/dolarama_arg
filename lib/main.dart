import 'package:dolarama_arg/providers/dollar_provider.dart';
import 'package:dolarama_arg/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DollarProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Dolarama",
        home: MainScreen(),
      ),
    );
  }
}

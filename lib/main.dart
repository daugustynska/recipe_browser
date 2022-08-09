import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_finder/views/home.dart';

Future <void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          )),
      home: const HomePage(),
    );
  }
}

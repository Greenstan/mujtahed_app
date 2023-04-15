import 'package:flutter/material.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import './pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Declare providers used in app
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudyTimeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static const Color mainColorBase = Colors.cyan;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mujtahed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

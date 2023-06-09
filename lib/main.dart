import 'package:flutter/material.dart';
import 'package:mujtahed_app/chatgptHandler/providers/chats_providers.dart';
import 'package:mujtahed_app/chatgptHandler/providers/models_provider.dart';
import 'package:mujtahed_app/pages/splash_page.dart';
import 'package:mujtahed_app/providers/exams_list_provider.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import './pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static const Color mainColorBase = Colors.cyan;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Declare providers used in app

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StudyTimeProvider>(
          create: (context) => StudyTimeProvider(),
        ),
        ChangeNotifierProvider<ExamListProvider>(
          create: (context) => ExamListProvider(),
        ),
        ChangeNotifierProvider<ChatProvider>(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider<ModelsProvider>(
          create: (context) => ModelsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Mujtahed',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        // home: MyHomePage(),
        initialRoute: '/',

        routes: {
          '/': (context) => SplashScreenPage(),
        },
      ),
    );
  }
}

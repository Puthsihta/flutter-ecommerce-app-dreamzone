import 'package:dreamzone/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DreamzoneApp());
}

class DreamzoneApp extends StatelessWidget {
  const DreamzoneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DreamZone App',
      initialRoute: '/',
      routes: {
        '/': (context) => const TabNavigationBar(),
      },
      // home: Home(),
    );
  }
}

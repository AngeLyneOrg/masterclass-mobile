import 'package:flutter/material.dart';
import 'package:masterclass/core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MasterClass',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: true,
    );
  }
}

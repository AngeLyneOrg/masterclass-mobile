import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masterclass/features/home/presentation/pages/home_screen.dart';
import 'package:masterclass/features/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    // 1. La route initiale de l'application (votre écran de chargement)
    initialLocation: '/',

    // 2. Gestion des erreurs de navigation (Page 404)
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page non trouvée')),
    ),

    // 3. Liste de toutes les routes de l'application
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
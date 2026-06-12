import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:masterclass/features/auth/presentation/pages/login_screen.dart';
import 'package:masterclass/features/auth/presentation/pages/register_screen.dart';
import 'package:masterclass/features/auth/presentation/providers/auth_provider.dart';
import 'package:masterclass/features/home/presentation/pages/home_screen.dart';
import 'package:masterclass/features/splash_screen.dart';

class AppRouter {
  static final _container = ProviderContainer();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',

    // Error manager (page not found 404)
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('PAGE NOT FOUND! (404)'))),

    // global redirection
    redirect: (context, state) {
      final auth = _container.read(authProvider);

      if (auth.status == AuthStatus.initial) {
        return null;
      }

      final isAuthenticated = auth.isAuthenticated;
      final currentLocation = state.matchedLocation;

      // public routes
      final isPublicRoute =
          currentLocation == '/splash' ||
          currentLocation == '/login' ||
          currentLocation == '/register';

      // private route
      final isPrivateRoute = currentLocation == '/home';

      // case 1: not authenticated → private route → redirect to login
      if (!isAuthenticated && isPrivateRoute) {
        return '/login';
      }

      // case 2: authenticated → auth pages → redirect to home
      if (isAuthenticated &&
          (currentLocation == '/login' || currentLocation == '/register')) {
        return '/home';
      }

      // case 3: authenticated → splash → redirect to home
      if (isAuthenticated && currentLocation == '/splash') {
        return '/home';
      }

      // case 4: no redirect needed
      return null;
    },

    // app routes
    routes: [
      // loading screens
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // auth screens (publics)
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // home screen (private)
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}

import 'package:amolgic_assignment/screens/details_screen.dart';
import 'package:amolgic_assignment/screens/home_screen.dart';
import 'package:amolgic_assignment/screens/login_screen.dart';
import 'package:amolgic_assignment/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) {
        // Ensure that state is properly handled or passed to your builder function
        print('Navigated to splash screen with state: $state');
        return SplashScreen();
      },
    ),

    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) {
        print('Navigated to login screen with state: $state');
        return LoginScreen();
      },
    ),
    GoRoute(
      name: 'details',
      path: '/details',
      builder: (context, state) {
        print('Navigated to details screen with state: $state');
        return DetailsScreen();
      },
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) {
        print('Navigated to home screen with state: $state');
        return HomeScreen();
      },
    ),
  ],
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      builder: (context, child) {
        // Add debug prints to inspect the state and route information
        print('Current route information: ${router.routerDelegate.currentConfiguration}');
        return child!;
      },
    );
  }
}

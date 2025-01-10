import 'package:flutter/material.dart';
import 'package:tugas_akhirpab1/screens/login_screen.dart';
import 'package:tugas_akhirpab1/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MainApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kerajian app',
      theme:ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAC67A),
        primarySwatch: Colors.blue,
        ),
        home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
        routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen()
      },
    );
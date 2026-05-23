import 'package:flutter/material.dart';
import 'screens/task_list_screen.dart';


void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,

      title: 'To-Do List',

      // ── App-wide theme ────────────────────────────────
      theme: ThemeData(
        // Use Material 3 design system
        useMaterial3: true,

        // Seed colour — drives the whole colour palette
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7B2FFF), // purple
          brightness: Brightness.light,
        ),

        // Default font for the whole app
        fontFamily: 'Roboto',

        // AppBar theme — white background, no shadow
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1A1A2E),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF1A1A2E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
          ),
        ),

        // Scaffold background — very light grey
        scaffoldBackgroundColor: const Color(0xFFF8F8FC),
      ),

      // First screen the user sees
      home: const TaskListScreen(),
    );
  }
}

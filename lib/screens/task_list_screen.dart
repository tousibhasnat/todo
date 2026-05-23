// ─────────────────────────────────────────────────────────
//  screens/task_list_screen.dart
//  Screen 1 — The To-Do List screen.
//  Shows a list of tasks inside Card widgets using ListView.
//  Tapping the "+" button navigates to the Add Task screen.
// ─────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  // ── Sample data — matches the design image exactly ──────
  // In a real app this would come from a database or API.
  // For this assignment we only need UI, so we hardcode it.
  static const List<Task> _tasks = [
    Task(
      id: '01',
      title: 'Market Research',
      time: '10:00 AM',
      timeAgo: '10 minutes ago',
      status: TaskStatus.done,
      iconColor: Color(0xFFFCE4EC), // light pink
      icon: Icons.shopping_bag_outlined,
    ),
    Task(
      id: '02',
      title: 'Competitive Analysis',
      time: '12:00 PM',
      timeAgo: '',
      status: TaskStatus.inProgress,
      iconColor: Color(0xFFFCE4EC), // light pink
      icon: Icons.shopping_bag_outlined,
    ),
    Task(
      id: '03',
      title: 'Create Low-fidelity Wireframe',
      time: '07:00 PM',
      timeAgo: '',
      status: TaskStatus.toDo,
      iconColor: Color(0xFFEDE7FF), // light purple
      icon: Icons.help_outline,
    ),
    Task(
      id: '04',
      title: 'How to pitch a Design Sprint',
      time: '09:00 PM',
      timeAgo: '',
      status: TaskStatus.toDo,
      iconColor: Color(0xFFFFEEDD), // light orange
      icon: Icons.book_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),

      // ── App Bar ───────────────────────────────────────────
      // No AppBar widget used here — we build a custom header
      // inside the body so the title aligns left like the design.

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // ── Page title ───────────────────────────────
              const Text(
                'To-Do List',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 20),

              // ── Task list ─────────────────────────────────
              // Expanded makes the ListView fill all remaining space.
              // ListView.builder is efficient — it only builds cards
              // that are currently visible on screen.
              Expanded(
                child: ListView.builder(
                  // Remove any extra padding at top/bottom of the list
                  padding: EdgeInsets.zero,

                  // Number of items in our list
                  itemCount: _tasks.length,

                  // Builder function — called once per item
                  itemBuilder: (context, index) {
                    return TaskCard(task: _tasks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // ── Floating Action Button ────────────────────────────
      // The "+" button in the bottom right.
      // Tapping it navigates to the Add Task screen.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push adds a new screen on top of the stack.
          // The user can press the back arrow to return here.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF7B2FFF), // purple
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}

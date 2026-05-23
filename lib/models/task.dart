

import 'package:flutter/material.dart';

// Possible status values for a task
enum TaskStatus {
  done,
  inProgress,
  toDo,
}

// Extension to get the display label and colours for each status
extension TaskStatusExtension on TaskStatus {
  // The text shown on the badge chip
  String get label {
    switch (this) {
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.toDo:
        return 'To-do';
    }
  }

  // Background colour of the status chip
  Color get chipColor {
    switch (this) {
      case TaskStatus.done:
        return const Color(0xFFEDE7FF);
      case TaskStatus.inProgress:
        return const Color(0xFFFFEEDD);
      case TaskStatus.toDo:
        return const Color(0xFFE8F4FF);
    }
  }

  // Text colour of the status chip
  Color get textColor {
    switch (this) {
      case TaskStatus.done:
        return const Color(0xFF7B2FFF);
      case TaskStatus.inProgress:
        return const Color(0xFFFF6B00);
      case TaskStatus.toDo:
        return const Color(0xFF1E90FF);
    }
  }
}

// The Task data class
class Task {
  final String id;
  final String title;
  final String time;
  final String timeAgo;
  final TaskStatus status;
  final Color iconColor;
  final IconData icon;

  const Task({
    required this.id,
    required this.title,
    required this.time,
    this.timeAgo = '',
    required this.status,
    required this.iconColor,
    required this.icon,
  });
}

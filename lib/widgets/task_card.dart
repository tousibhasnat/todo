

import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  // The task data to display — passed in from the parent widget
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Space between cards
      margin: const EdgeInsets.only(bottom: 14),

      // White rounded card with soft shadow
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Row 1: ID label + Icon badge ──────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "ID: 01" text in grey
                Text(
                  'ID: ${task.id}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9E9E9E),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),

                // Icon badge on the right — coloured circle with icon
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: task.iconColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    task.icon,
                    size: 18,
                    // Darken the icon color relative to background
                    color: task.iconColor == const Color(0xFFFCE4EC)
                        ? const Color(0xFFE91E63)   // pink icon
                        : task.iconColor == const Color(0xFFEDE7FF)
                            ? const Color(0xFF7B2FFF) // purple icon
                            : const Color(0xFFFF6B00),// orange icon
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // ── Row 2: Task title ──────────────────────────
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
                height: 1.3,
              ),
            ),

            const SizedBox(height: 10),

            // ── Row 3: Time + Status chip ──────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Clock icon + time text
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Color(0xFF7B2FFF), // purple clock
                    ),
                    const SizedBox(width: 4),

                    // Show "10:00 AM (10 minutes ago)" or just "10:00 AM"
                    Text(
                      task.timeAgo.isNotEmpty
                          ? '${task.time} (${task.timeAgo})'
                          : task.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9E9E9E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                // Status chip — coloured pill badge
                _StatusChip(status: task.status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
//  _StatusChip — a small private widget for the status badge
//  Private (underscore) means it's only used in this file.
// ─────────────────────────────────────────────────────────
class _StatusChip extends StatelessWidget {
  final TaskStatus status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        // Background colour from the status extension
        color: status.chipColor,
        borderRadius: BorderRadius.circular(20), // pill shape
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          // Text colour from the status extension
          color: status.textColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

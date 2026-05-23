// ─────────────────────────────────────────────────────────
//  screens/add_task_screen.dart
//  Screen 2 — The Add Task screen.
//  Shows a form with a Task Group field and Description field.
//  Has a back arrow (navigation) and an Add button at the bottom.
//  No save logic needed — only UI and navigation.
// ─────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

// We use StatefulWidget because TextEditingControllers need to
// be disposed when the widget is removed from the screen.
class _AddTaskScreenState extends State<AddTaskScreen> {
  // Controllers let us read/write the text in each field
  final TextEditingController _descriptionController = TextEditingController();

  // GlobalKey lets us validate the form programmatically
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Always dispose controllers to free up memory
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),

      // ── AppBar ────────────────────────────────────────────
      // Shows "Add Task" title with a back arrow on the left.
      // Flutter automatically adds the back arrow when we
      // push a new screen with Navigator.push().
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        // Back arrow icon
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1A1A2E),
          ),
          onPressed: () {
            // Pop removes this screen and returns to the previous one
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
      ),

      // ── Body ──────────────────────────────────────────────
      // Stack lets us layer the Add button on top of the form.
      // We use a Column + ScrollView for the form content,
      // and position the button at the bottom.
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // The form fields take up all space except the button
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      // ── Task Group Card ─────────────────────
                      // A white rounded card showing the task group.
                      // Matches the design: icon + "Work" label.
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Small grey label above the value
                            const Text(
                              'Task Group',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF9E9E9E),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Icon + "Work" row
                            Row(
                              children: [
                                // Small pink badge icon — matches the design
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFCE4EC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color(0xFFE91E63),
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Group name
                                const Text(
                                  'Work',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1A1A2E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ── Description Card ────────────────────
                      // A white card containing a multi-line TextFormField.
                      // TextFormField is a text input widget that works
                      // with Form for validation.
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Small grey label
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF9E9E9E),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // TextFormField — the actual text input widget
                            TextFormField(
                              controller: _descriptionController,

                              // maxLines: null allows unlimited lines
                              maxLines: null,

                              // minLines keeps the field at least 5 lines tall
                              minLines: 5,

                              // No border on the field itself — the Card provides the border
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter task description...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFBDBDBD),
                                  fontSize: 14,
                                ),
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),

                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF424242),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Add Button ───────────────────────────────────
              // Pinned to the bottom of the screen.
              // ElevatedButton with full width and purple colour.
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: SizedBox(
                  width: double.infinity,  // full width
                  height: 56,              // fixed height like the design
                  child: ElevatedButton(
                    onPressed: () {
                      // For this assignment: only UI is required.
                      // We just show a snackbar to confirm the button works,
                      // then go back to the task list.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Task added! (UI only — no database)'),
                          backgroundColor: Color(0xFF7B2FFF),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                      // Purple background
                      backgroundColor: const Color(0xFF7B2FFF),

                      // White text
                      foregroundColor: Colors.white,

                      // Remove shadow for a flat look
                      elevation: 0,

                      // Rounded corners
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

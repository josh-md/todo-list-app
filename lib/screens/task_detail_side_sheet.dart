import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskDetailPanel extends StatelessWidget {
  final Task? task;

  const TaskDetailPanel({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (task == null) {
      return Center(
        child: Text(
          'Select a task to view details',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
                task!.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              //edit task
            }, 
            icon: Icon(Icons.edit))
        ],
      ),
      body: Container(
        //color: Colors.blue,
        child: Material(
          elevation: 4.0, // Adds elevation for a shadow effect
          borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.white, // Background color for the panel
              border: Border(
                left: BorderSide(
                  color: Colors.blue, // Left border color
                  width: 4.0, // Width of the left border
                ),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task!.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(task!.description),
                const SizedBox(height: 16),
                Text('Topic: ${task!.topic}'),
                const SizedBox(height: 16),
                Text('Notes: ${task!.notes}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Edit task logic
                  },
                  child: const Text('Edit Task'),
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task_model.dart';
import '../cubits/task_cubit.dart';

class TaskDetailPanel extends StatelessWidget {
  const TaskDetailPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, List<Task>>(
      builder: (context, tasks) {
        final selectedTask = context.watch<TaskCubit>().selectedTask;
        // Get the selected task (implement this selection logic in the TaskListPanel)

        if (selectedTask == null) {
          return Center(
            child: Text(
              'Select a task to view details',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.black12,
                width: 4.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedTask.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Description: ${selectedTask.description}',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Topic: ${selectedTask.topic}',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              Text(
                'Notes:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(selectedTask.notes),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement editing task details
                },
                child: const Text('Edit Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}
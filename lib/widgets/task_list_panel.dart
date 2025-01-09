import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/task_cubit.dart';
import '../models/task_model.dart';
import 'create_task_dialog.dart';

class TaskListPanel extends StatelessWidget {
  const TaskListPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStatus = TaskStatus.todo;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentStatus.name.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Tooltip here',
            icon: Icon(Icons.graphic_eq_rounded),
            onPressed: () {
              //action here
            }, 
           ),
          IconButton(
            tooltip: 'Tooltip here',
            icon: Icon(Icons.graphic_eq_rounded),
            onPressed: () {
              //action here
            }, 
           ),
          IconButton(
          tooltip: 'Tooltip here',
          icon: Icon(Icons.graphic_eq_rounded),
          onPressed: () {
            //action here
            }, 
          ),
        ],
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return ListView(
            children: [
              ...tasks.map((task) {
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text(task.topic),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    context.read<TaskCubit>().selectTask(task);
                  },
                );
              }).toList(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCreateTaskDialog(context); // Open the task creation dialog
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
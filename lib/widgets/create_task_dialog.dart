import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/task_cubit.dart';
import '../models/task_model.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  _CreateTaskDialogState createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _topic = '';
  String _notes = '';
  TaskStatus _status = TaskStatus.todo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Task'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Topic'),
                onSaved: (value) {
                  _topic = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Notes'),
                onSaved: (value) {
                  _notes = value!;
                },
              ),
              DropdownButtonFormField<TaskStatus>(
                decoration: const InputDecoration(labelText: 'Status'),
                value: _status,
                items: TaskStatus.values
                    .map(
                      (status) => DropdownMenuItem(
                        value: status,
                        child: Text(status.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              // Create a new task
              context.read<TaskCubit>().createTask(
                    name: _name,
                    description: _description,
                    topic: _topic,
                    notes: _notes,
                    status: _status,
                  );

              Navigator.of(context).pop(); // Close dialog
            }
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}

Future<void> showCreateTaskDialog(BuildContext context) async {
  await showDialog(
    context: context, 
    builder: (context) {
      return const CreateTaskDialog();
    },
  );
}
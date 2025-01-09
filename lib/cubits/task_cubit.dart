import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task_model.dart';

class TaskCubit extends Cubit<List<Task>> {
  final List<Task> allTasks; // Master list of all tasks
  Task? selectedTask;

  TaskCubit()
      : allTasks = [
          // Dummy data
          Task(
            id: '1',
            name: 'Buy groceries',
            description: 'Buy milk, eggs, and bread',
            topic: 'Home',
            notes: 'Check for discounts on bread',
            status: TaskStatus.todo,
          ),
          Task(
            id: '2',
            name: 'Prepare presentation',
            description: 'Create slides for the Monday meeting',
            topic: 'Work',
            notes: 'Focus on Q4 metrics',
            status: TaskStatus.backlog,
          ),
          Task(
            id: '3',
            name: 'Review Presentation',
            description: 'Review the linked presentation',
            topic: 'Work',
            notes: 'Focus on Q4 metrics',
            status: TaskStatus.doing,
          ),
          Task(
            id: '4',
            name: 'Complete Slide Deck',
            description: 'Use figma slides to complete deck',
            topic: 'Work',
            notes: 'Insert figma slides link here to view',
            status: TaskStatus.done,
          ),
          Task(
            id: '5',
            name: 'Run to Home Depot',
            description: 'Grab fertilizer for front lawn',
            topic: 'Home',
            notes: 'Winter fertilizer to protect grass from cold weather',
            status: TaskStatus.done,
          ),
        ],
        super([
          // Initialize the state with all tasks
          Task(
            id: '1',
            name: 'Buy groceries',
            description: 'Buy milk, eggs, and bread',
            topic: 'Home',
            notes: 'Check for discounts on bread',
            status: TaskStatus.todo,
          ),
          Task(
            id: '2',
            name: 'Prepare presentation',
            description: 'Create slides for the Monday meeting',
            topic: 'Work',
            notes: 'Focus on Q4 metrics',
            status: TaskStatus.backlog,
          ),
          Task(
            id: '3',
            name: 'Review Presentation',
            description: 'Review the linked presentation',
            topic: 'Work',
            notes: 'Focus on Q4 metrics',
            status: TaskStatus.doing,
          ),
          Task(
            id: '4',
            name: 'Complete Slide Deck',
            description: 'Use figma slides to complete deck',
            topic: 'Work',
            notes: 'Insert figma slides link here to view',
            status: TaskStatus.done,
          ),
          Task(
            id: '5',
            name: 'Run to Home Depot',
            description: 'Grab fertilizer for front lawn',
            topic: 'Home',
            notes: 'Winter fertilizer to protect grass from cold weather',
            status: TaskStatus.done,
          ),
        ]);

  void updateTask(Task updatedTask) {
    // Update task in the master list
    final index = allTasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      allTasks[index] = updatedTask;
    }
    emit(List.from(allTasks)); // Re-emit the current master list
  }

  void createTask({
    required String name,
    required String description,
    required String topic,
    required String notes,
    required TaskStatus status,
  }) {
    //generate unique ID
    final newTask = Task(
      id: DateTime.now().toIso8601String(), // Unique ID based on timestamp 
      name: name, 
      description: description, 
      topic: topic, 
      notes: notes, 
      status: status,
      );
    allTasks.add(newTask);

    emit(List.from(allTasks));
  }

  void deleteTask(String taskId) {
    // Remove from the master list
    allTasks.removeWhere((task) => task.id == taskId);
    emit(List.from(allTasks)); // Re-emit the current master list
  }

  void filterTasks(TaskStatus? status) {
    if (status == null) {
      emit(List.from(allTasks)); // Show all tasks
    } else {
      // Filter tasks based on the master list
      final filteredTasks = allTasks.where((task) => task.status == status).toList();
      emit(filteredTasks);
    }
  }

  void selectTask(Task task) {
    selectedTask = task;
    emit(List.from(state)); // Re-emit the current state to trigger updates
  }
}
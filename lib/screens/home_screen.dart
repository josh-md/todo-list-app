import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/status_navigation_panel.dart';
import '../widgets/task_list_panel.dart';
import '../widgets/task_detail_panel.dart';
import '../cubits/task_cubit.dart';
import '../models/task_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(children: [
            StatusNavigationPanel(),
            Expanded(flex: 2, child: TaskListPanel()),
            ],
          ),
          BlocBuilder<TaskCubit, List<Task>>(
            builder: (context, tasks) {
              final selectedTask = context.read<TaskCubit>().selectedTask;

              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                right: selectedTask == null ? -400 : 0, //slide out or in
                top: 0,
                bottom: 0,
                width: 400, //adjust panel width as needed
                child: TaskDetailPanel(), 
                );
            },
          )
        ],
      ),
    );
  }
}
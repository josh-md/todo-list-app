import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/task_cubit.dart';
import '../models/task_model.dart';
import 'create_task_dialog.dart';

class StatusNavigationPanel extends StatefulWidget {
  const StatusNavigationPanel({super.key});

  @override
  _StatusNavigationPanelState createState() => _StatusNavigationPanelState();
}

class _StatusNavigationPanelState extends State<StatusNavigationPanel> {
  int _selectedIndex = 0;

  final List<TaskStatus?> statuses = [null, ...TaskStatus.values];

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        final selectedStatus = statuses[_selectedIndex];
        context.read<TaskCubit>().filterTasks(selectedStatus);
      },
      leading: FloatingActionButton(
        onPressed: () {
          showCreateTaskDialog(context);
          },
        child: const Icon(Icons.add),
        ),
      labelType: NavigationRailLabelType.all,
      destinations: statuses
          .map(
            (status) => NavigationRailDestination(
              icon: status == null 
                  ? const Icon(Icons.list)
                  : const Icon(Icons.folder),
              selectedIcon: status == null
                  ? const Icon(Icons.list_alt)
                  : const Icon(Icons.folder_open),
              label: Text(
                status == null ? 'All Tasks' : status.name.toUpperCase(),
              ),
            ),
          )
          .toList(),
    );
  }
}
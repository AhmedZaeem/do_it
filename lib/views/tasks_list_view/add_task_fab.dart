import 'package:flutter/material.dart';

import '../task_details_page/task_details_view.dart';

class AddTaskFab extends StatelessWidget {
  const AddTaskFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TaskDetailsView(),
        ),
      ),
      child: const Icon(
        Icons.article_outlined,
        color: Colors.white,
      ),
    );
  }
}

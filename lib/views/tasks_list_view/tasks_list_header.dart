import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/theme_view_model/theme_state_changer.dart';

class TasksListHeader extends StatelessWidget {
  const TasksListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('Task List', style: Theme.of(context).textTheme.displayLarge),
        const Spacer(),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              IconButton(
                  onPressed: () =>
                      ref.read(themeProvider.notifier).changeTheme(context),
                  icon: const Icon(
                    Icons.sunny,
                  )),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
            )),
      ],
    );
  }
}

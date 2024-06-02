import 'package:do_it/view_model/favorite_model_view/favorite_model_view.dart';
import 'package:do_it/view_model/favorite_model_view/favorite_state_notifier.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../view_model/theme_model_view/theme_view_model.dart';

class TasksListHeader extends ConsumerWidget {
  const TasksListHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(taskChangeNotifier);
    bool showFav = ref.watch(favoriteChangeNotifier);
    return Row(
      children: <Widget>[
        Text('Task List', style: Theme.of(context).textTheme.displayLarge),
        const Spacer(),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              IconButton(
                  onPressed: () => ThemeViewModel.onThemeSwitch(context),
                  icon: const Icon(
                    Icons.sunny,
                  )),
        ),
        IconButton(
            onPressed: () {
              FavoriteModelView().toggleFavorite(context);
            },
            icon: Icon(
              showFav ? Icons.favorite : Icons.favorite_border,
            )),
      ],
    );
  }
}

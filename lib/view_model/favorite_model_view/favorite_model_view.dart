import '../task_model_view/task_state_notifier.dart';
import 'favorite_state_notifier.dart';

class FavoriteModelView {
  toggleFavorite(context) {
    context.watch(favoriteChangeNotifier.notifier).toggleFavorite();
    context.invalidate(taskChangeNotifier);
    context.refresh(taskChangeNotifier);
  }
}

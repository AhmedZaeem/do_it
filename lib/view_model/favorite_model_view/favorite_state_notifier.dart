import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteStateNotifier extends StateNotifier<bool> {
  FavoriteStateNotifier() : super(false);

  void toggleFavorite() {
    state = !state;
  }
}

final favoriteChangeNotifier =
    StateNotifierProvider<FavoriteStateNotifier, bool>(
        (ref) => FavoriteStateNotifier());

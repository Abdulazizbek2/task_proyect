import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProviderController = StateNotifierProvider<HomePagesConTroller, int>(
    (ref) => HomePagesConTroller(0));

class HomePagesConTroller extends StateNotifier<int> {
  HomePagesConTroller(super.state);
  void setPosition(int value) {
    state = value;
  }
}

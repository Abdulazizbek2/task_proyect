import 'package:bloc/bloc.dart';

class SFCEvents {
  int id;
  SFCEvents({required this.id});
}

class SFCDecrementEvent extends SFCEvents {
  SFCDecrementEvent({required super.id});
}

class SFCIncrementEvent extends SFCEvents {
  SFCIncrementEvent({required super.id});
}

class SFCInitializaEvent extends SFCEvents {
  SFCInitializaEvent({required super.id});
}

class SelFoodState {
  Map<int, int> foods;
  SelFoodState({required this.foods});
}

class HomeBloc extends Bloc<SFCEvents, SelFoodState> {
  HomeBloc() : super(SelFoodState(foods: {0: 0})) {
    on<SFCInitializaEvent>(
      (event, emit) {
        final position = event.id;
        emit(SelFoodState(foods: position));
      },
    );
    on<SFCIncrementEvent>((event, emit) {
      state.foods[event.id] = state.foods[event.id]! + 1;
      emit(state);
    });
    on<SFCDecrementEvent>(
      (event, emit) {
        state.foods[event.id] = state.foods[event.id]! - 1;
        emit(state);
      },
    );
  }
}

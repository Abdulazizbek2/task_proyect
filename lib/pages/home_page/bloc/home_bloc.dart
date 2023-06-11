import 'package:bloc/bloc.dart';
import 'package:task_proyect/src/storadge_service/shared_prefs_repo.dart';

class SFCEvents {
  int id;
  SFCEvents({required this.id});
}

class SFCDecrementEvent extends SFCEvents {
  SFCDecrementEvent({required super.id});
}

class SFCAddEvent extends SFCEvents {
  SFCAddEvent({required super.id});
}

class SFCDeleteEvent extends SFCEvents {
  SFCDeleteEvent({required super.id});
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
  HomeBloc() : super(SelFoodState(foods: {})) {
    on<SFCInitializaEvent>(
      (event, emit) async {
        final foods = await Prefs.loadDataFromLocal(key: "foods");
        print("----------------------$foods");
        emit(SelFoodState(foods: foods ?? {}));
      },
    );
    on<SFCIncrementEvent>((event, emit) async {
      Map<int, int> foodsMap = state.foods;
      foodsMap[event.id] = foodsMap[event.id]! + 1;
      await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
      emit(SelFoodState(foods: foodsMap));
    });
    on<SFCDecrementEvent>(
      (event, emit) async {
        Map<int, int> foodsMap = state.foods;
        foodsMap[event.id] = foodsMap[event.id]! - 1;
        await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
        emit(SelFoodState(foods: foodsMap));
      },
    );
    on<SFCAddEvent>(
      (event, emit) async {
        Map<int, int> foodsMap = state.foods;
        foodsMap[event.id] = 1;
        await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
        emit(SelFoodState(foods: foodsMap));
      },
    );
    on<SFCDeleteEvent>(
      (event, emit) async {
        Map<int, int> foodsMap = state.foods;
        foodsMap.remove(event.id);
        await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
        emit(SelFoodState(foods: foodsMap));
      },
    );
  }
  addTocard(SFCEvents event) async {
    Map<int, int> foodsMap = state.foods;
    foodsMap[event.id] = 1;
    await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
    state.foods = foodsMap;
    // emit(SelFoodState(foods: foodsMap));
  }
}

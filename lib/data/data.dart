import 'package:task_proyect/models/food_model/food_model.dart';

List<FoodModel> data = [
  FoodModel(
      id: 1,
      name: "Рис с овощами",
      imagePath: "assets/food1.png",
      description:
          "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой",
      kitchen: "Азиатская кухня",
      type: ["С рисом"],
      price: 799,
      weight: 560),
  FoodModel(
      id: 2,
      name: "Салат по восточному",
      imagePath: "assets/food2.png",
      description:
          "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой",
      kitchen: "Азиатская кухня",
      type: ["Салаты"],
      price: 799,
      weight: 560),
  FoodModel(
      id: 3,
      name: "Рыба с овощами и рисом",
      imagePath: "assets/food3.png",
      description:
          "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой",
      kitchen: "Азиатская кухня",
      type: ["С рисом", "С рыбой"],
      price: 799,
      weight: 560),
  FoodModel(
      id: 4,
      name: "Тортеллини",
      imagePath: "assets/food4.png",
      description:
          "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой",
      kitchen: "Азиатская кухня",
      type: ["Пельмени"],
      price: 799,
      weight: 560),
  FoodModel(
      id: 5,
      name: "Зеленый салат",
      imagePath: "assets/food5.png",
      description:
          "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой",
      kitchen: "Азиатская кухня",
      type: ["Салаты"],
      price: 390,
      weight: 420),
  FoodModel(
      id: 6,
      name: "Рулеты из ветчины",
      imagePath: "assets/food6.png",
      description:
          "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой",
      kitchen: "Азиатская кухня",
      type: ["Роллы"],
      price: 815,
      weight: 380),
];

List<String> tegs = [
  "Все меню",
  "Салаты",
  "С рисом",
  "С рыбой",
  "Роллы",
  "Пельмени"
];

List<FoodModel> getData(String teg) {
  if ("Все меню" == teg) {
    return data;
  }
  return data.where((element) => element.type!.contains(teg)).toList();
}

// "Салаты", "С рисом", "С рыбой", "Роллы"
// Map<int,int>{

// }
// {id:count,id:count}
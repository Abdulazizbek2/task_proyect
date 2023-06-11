import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:task_proyect/data/data.dart';
import 'package:task_proyect/models/food_model/food_model.dart';
import '../../utils/utils.dart';
import '../../widgets/home_app_bar/home_app_bar.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  FoodModel food = data[4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(children: [
          OrderFoodCounterWidget(food: data[4]),
          OrderFoodCounterWidget(food: data[5]),
          OrderFoodCounterWidget(food: data[2]),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 48.h,
                margin: EdgeInsets.all(8.w),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppConstant.selectedButtonColor,
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Text(
                  "Оплатить 2 004 ₽",
                  style: TextStyle(
                      fontSize: 16.w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
          )
        ]),
      ),
    );
  }
}

class OrderFoodCounterWidget extends StatelessWidget {
  const OrderFoodCounterWidget({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      // horizontalTitleGap: -1,
      leading: Image.asset(
        food.imagePath!,
        fit: BoxFit.cover,
        width: 62.w,
        height: 62.w,
      ),
      title: Text(
        food.name!,
        style: TextStyle(
            height: 0,
            fontSize: 14.w,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400),
        textAlign: TextAlign.left,
      ),
      subtitle: Row(
        children: [
          Text(
            "${food.price!.ceil()} ₽",
            style: TextStyle(
                fontSize: 14.w,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          Text(
            " · ${food.weight!.ceil()} г",
            style: TextStyle(
                color: AppConstant.textColor1,
                fontSize: 14.w,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      trailing: Container(
          height: 32.h,
          width: 99.w,
          padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 6.h),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppConstant.counterButtonCollor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24.w,
                child: IconButton(
                    splashRadius: 1.w,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      weight: 24.w,
                    )),
              ),
              Text(
                "1",
                style: TextStyle(
                    fontSize: 14.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                width: 24.w,
                child: IconButton(
                    splashRadius: 1.w,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      weight: 24.w,
                    )),
              ),
            ],
          )),
    );
  }
}

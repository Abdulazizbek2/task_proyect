import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';
import 'package:task_proyect/models/food_model/food_model.dart';
import 'package:task_proyect/pages/home_page/bloc/home_bloc.dart';
import 'package:task_proyect/utils/utils.dart';
import '../../data/data.dart';
import '../../routes/app_routes.dart';
// import '../../widgets/tags_but_bar/tags_button_bar_widget.dart';

class CategoryPage extends StatefulWidget {
  final String? text;
  const CategoryPage({super.key, required this.text});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<FoodModel> foods;
  late String selectedTeg;
  List<bool> isCardEnabled = [true];

  @override
  void initState() {
    foods = data;
    selectedTeg = tegs[0];
    super.initState();
  }

  void sortFoods(tag) {
    foods = getData(tag);
  }

  @override
  Widget build(BuildContext context) {
    foods = getData(selectedTeg);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(AppRoute.root.path);
          },
        ),
        centerTitle: true,
        title: Text(widget.text ?? "qwerty"),
        actions: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
            height: 44.h,
            width: 44.w,
            child: Image.asset(AppConstant.acountImage),
          ),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            tagbar(),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 109.w / 145.h,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
              ),
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 28.h),
              itemCount: foods.length * 2,
              itemBuilder: (BuildContext context, int index) {
                return FoodCardWidget(
                  cnt: context,
                  foodModel: foods[index % foods.length],
                );
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget tagbar() {
    return SizedBox(
      height: 40.h,
      // width: 700,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 16.w),
          scrollDirection: Axis.horizontal,
          itemCount: tegs.length,
          itemBuilder: (BuildContext context, int index) {
            isCardEnabled.add(false);
            return GestureDetector(
                onTap: () {
                  selectedTeg = tegs[index];
                  isCardEnabled.replaceRange(0, isCardEnabled.length,
                      [for (int i = 0; i < isCardEnabled.length; i++) false]);
                  isCardEnabled[index] = true;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: isCardEnabled[index]
                          ? AppConstant.selectedButtonColor
                          : AppConstant.unSelectedButtonColor2,
                      borderRadius: BorderRadius.circular(8.h)),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8.h),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 40.h,
                  child: Text(
                    tegs[index],
                    style: TextStyle(
                        color:
                            isCardEnabled[index] ? Colors.white : Colors.black,
                        fontSize: 14.h,
                        letterSpacing: 0.11,
                        fontWeight: FontWeight.w400),
                  ),
                ));
          }),
    );
  }
}

class FoodCardWidget extends StatelessWidget {
  final FoodModel foodModel;
  final BuildContext cnt;
  const FoodCardWidget({super.key, required this.foodModel, required this.cnt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return CustomSelectHomeButtonsDialog(
              foodModel: foodModel,
              cnt: cnt,
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: Image.asset(foodModel.imagePath!)),
          SizedBox(
            child: Text(
              foodModel.name!,
              style: TextStyle(
                  fontSize: 12.5.w,
                  letterSpacing: 0.1,
                  height: 0.8.h,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}

class CustomSelectHomeButtonsDialog extends StatelessWidget {
  final BuildContext cnt;
  final FoodModel foodModel;
  const CustomSelectHomeButtonsDialog(
      {super.key, required this.foodModel, required this.cnt});

  @override
  Widget build(BuildContext context) {
    final bloc = cnt.read<HomeBloc>();
    return Dialog(
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        // color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      image: DecorationImage(
                          image: AssetImage(foodModel.imagePath!),
                          fit: BoxFit.fitWidth)),
                  height: 265.w,
                  width: double.infinity,
                ),
                Positioned(
                    right: 0,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.only(top: 8.w, right: 8.w),
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                size: 23.h,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 8.h, right: 8.w),
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                              child: Icon(
                                Icons.close,
                                size: 18.h,
                              )),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              foodModel.name!,
              style: TextStyle(fontSize: 15.w, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Text(
                  "${foodModel.price!.ceil()} ₽",
                  style: TextStyle(fontSize: 13.w, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                Text(
                  " · ${foodModel.weight!.ceil()} г",
                  style: TextStyle(
                      color: AppConstant.textColor1,
                      fontSize: 13.w,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Text(
              foodModel.description!,
              style: TextStyle(
                  color: AppConstant.textColor2,
                  fontSize: 13.w,
                  height: 0,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 16.h,
            ),
            StreamBuilder<SelFoodState?>(
                initialData: bloc.state,
                stream: bloc.stream,
                builder: (context, snapshot) {
                  Map<String, dynamic> foodMap = snapshot.data!.foods;
                  return GestureDetector(
                    onTap: () {
                      if (!foodMap.containsKey(foodModel.id)) {
                        bloc.add(SFCAddEvent(id: foodModel.id!));
                      }
                    },
                    child: Container(
                        height: 48.h,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: foodMap.containsKey(foodModel.id)
                              ? AppConstant.unSelectedButtonColor1
                              : AppConstant.selectedButtonColor,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: Text(
                          foodMap.containsKey(foodModel.id)
                              ? "Добавлено в корзинку"
                              : "Добавить в корзинку",
                          style: TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  );
                })
          ],
        ),
      ),
    );
  }
}

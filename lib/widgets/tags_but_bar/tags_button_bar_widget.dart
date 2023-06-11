import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../data/data.dart';
import '../../utils/utils.dart';

class TagsButtonsBarWidget extends StatefulWidget {
  const TagsButtonsBarWidget({super.key});

  @override
  State<TagsButtonsBarWidget> createState() => _TagsButtonsBarWidgetState();
}

class _TagsButtonsBarWidgetState extends State<TagsButtonsBarWidget> {
  List<bool> isCardEnabled = [true];
  @override
  Widget build(BuildContext context) {
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
                      borderRadius: BorderRadius.circular(10.h)),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 40.h,
                  child: Text(
                    tegs[index],
                    style: TextStyle(
                        color:
                            isCardEnabled[index] ? Colors.white : Colors.black,
                        fontSize: 14.w,
                        letterSpacing: 0.11,
                        fontWeight: FontWeight.w400),
                  ),
                ));
          }),
    );
  }
}

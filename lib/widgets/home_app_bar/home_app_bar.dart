import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:size_config/size_config.dart';

import '../../utils/utils.dart';

PreferredSize homeAppBar(BuildContext context) {
  DateFormat dateFormat = DateFormat('d MMMM, y', 'ru');
  var dateTime = DateTime.now();
  return PreferredSize(
      preferredSize: Size(double.infinity, 100.h),
      child: SafeArea(
        child: ListTile(
          horizontalTitleGap: -1,
          leading: Container(
            width: 17.w,
            height: 30.h,
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppConstant.location,
            ),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Санкт-Петербугр",
                  style: TextStyle(
                    fontSize: 17.w,
                    fontWeight: FontWeight.w500,
                  )),
              Text(
                dateFormat.format(dateTime).toString(),
                style: TextStyle(
                    fontSize: 13.w,
                    fontWeight: FontWeight.w400,
                    color: AppConstant.textDateColor),
              ),
            ],
          ),
          trailing: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
            height: 44.h,
            width: 44.w,
            child: Image.asset(AppConstant.acountImage),
          ),
        ),
      ));
}

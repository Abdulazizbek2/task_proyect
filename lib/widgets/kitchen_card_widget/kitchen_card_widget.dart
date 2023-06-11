import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';
import '../../routes/app_routes.dart';
import '../../utils/utils.dart';

class KitchenCardMenu extends StatelessWidget {
  final String? imageUrl;
  final String? text;
  final VoidCallback? onTap;
  final int item;
  const KitchenCardMenu(
      {super.key,
      required this.imageUrl,
      required this.text,
      required this.onTap,
      required this.item});

  @override
  Widget build(BuildContext context) {
    // print('${AppRoute.search.path}${AppRoute.detail.path}');
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRoute.detail.name,
            queryParameters: {"id1": text!, "id2": ""});
      },
      child: AspectRatio(
        aspectRatio: 7 / 3,
        child: Container(
          padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 136.w),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl!,
                ),
                invertColors: false,
                isAntiAlias: false,
                alignment: Alignment.centerRight,
                fit: BoxFit.scaleDown,
              ),
              borderRadius: BorderRadius.circular(10.h),
              color: AppConstant.listColorForCard[item]),
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 19.w,
                letterSpacing: 0.1,
                height: 1.25,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

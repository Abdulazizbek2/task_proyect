import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:size_config/size_config.dart';

import '../../pages/home_page/controller/page_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/utils.dart';

class BottomNavigationnWidget extends ConsumerStatefulWidget {
  const BottomNavigationnWidget({super.key});

  @override
  ConsumerState<BottomNavigationnWidget> createState() =>
      _BottomNavigationnWidgetState();
}

class _BottomNavigationnWidgetState
    extends ConsumerState<BottomNavigationnWidget> {
  static TextStyle optionStyle =
      TextStyle(fontSize: 10.w, fontWeight: FontWeight.w500);

  void _onDestinationSelected(int index) {
    ref.read(pageProviderController.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.go(AppRoute.root.path);
        break;
      case 1:
        context.go(AppRoute.search.path);
        break;
      case 2:
        context.go(AppRoute.basket.path);
        break;
      case 3:
        context.go(AppRoute.account.path);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final position = ref.watch(pageProviderController);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 0.2.h, color: AppConstant.textDateColor))),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppConstant.buttonHome,
              color:
                  position == 0 ? AppConstant.selectedButtonColor : Colors.grey,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppConstant.buttonSearch,
              color: position == 1
                  ? AppConstant.selectedButtonColor
                  : AppConstant.unSelectedButtonColor1,
            ),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppConstant.buttonBag,
              color: position == 2
                  ? AppConstant.selectedButtonColor
                  : AppConstant.unSelectedButtonColor1,
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppConstant.buttonProfile,
              color: position == 3
                  ? AppConstant.selectedButtonColor
                  : AppConstant.unSelectedButtonColor1,
            ),
            label: 'Аккаунт',
          ),
        ],
        elevation: 10.0.h,
        selectedLabelStyle: optionStyle,
        unselectedLabelStyle: optionStyle,
        currentIndex: position,
        selectedItemColor: AppConstant.selectedButtonColor,
        unselectedItemColor: AppConstant.unSelectedButtonColor1,
        onTap: _onDestinationSelected,
      ),
    );
    // });
  }
}

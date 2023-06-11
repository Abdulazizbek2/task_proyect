import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:size_config/size_config.dart';
import 'package:task_proyect/pages/home_page/bloc/home_bloc.dart';
import '../../models/kitchen_card_model/kitchen_card_model.dart';
import '../../widgets/home_app_bar/home_app_bar.dart';
import '../../src/dio_service/dio_repo.dart';
import '../../widgets/kitchen_card_widget/kitchen_card_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dio = DioNetworkService();
    final bloc = context.read<HomeBloc>();
    bloc.add(SFCInitializaEvent(id: 0));
    return Scaffold(
      appBar: homeAppBar(context),
      body: SafeArea(
          child: Column(children: [
        // const HomeAppBar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 7.h),
            child: FutureBuilder<List<KitchedCardModel?>?>(
                future: dio.getCardData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  List<KitchedCardModel?>? listData = snapshot.data;
                  return ListView.separated(
                    itemCount: listData!.length,
                    itemBuilder: (context, index) => KitchenCardMenu(
                      imageUrl: listData[index]!.imageUrl,
                      text: listData[index]!.name,
                      onTap: () {},
                      item: index % 4,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                  );
                }),
          ),
        )
      ])),
    );
  }
}

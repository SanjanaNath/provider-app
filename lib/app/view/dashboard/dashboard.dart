import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_setup/app/view/counter/counter_screen.dart';
import 'package:provider_setup/app/view/home/home.dart';
import 'package:provider_setup/app/view/request/request.dart';
import 'package:provider_setup/app/view/setting/setting.dart';

import '../../../core/config/app_images.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/gradients.dart';
import '../../../services/database/local_database.dart';
import '../../../utils/widgets/image_view.dart';
import '../../../utils/widgets/widgets.dart';
import '../../controller/dashboard/dashboard_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key, this.dashBoardIndex}) : super(key: key);
  final int? dashBoardIndex;

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  late int dashBoardIndex = widget.dashBoardIndex ?? 0;

  late List<Widget> dashboardScreens = [
     HomeView(),
    const RequestView(),
    const CounterScreen(),
    const SettingView(),
  ];





  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DashboardController>().changeDashBoardIndex(index: dashBoardIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('deviceToken ${LocalDatabase().deviceToken}');

    DashboardController dashboardController = Provider.of<DashboardController>(context);
    dashBoardIndex = dashboardController.dashBoardIndex;
    return WillPopScope(
      onWillPop: onAppExit,
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return dashboardScreens.elementAt(dashBoardIndex);
          },
        ),
        bottomSheet: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white, width: 0.7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageIcon(label: 'Home', image: AppImages.abeBooks, index: 0),
              imageIcon(label: 'Request', image: AppImages.abeBooks, index: 1),
              imageIcon(label: 'Counting', image: AppImages.abeBooks, index: 2),
              imageIcon(label: 'Settings', image: AppImages.abeBooks, index: 3),
            ],
          ),
        ),
      ),
    );
  }
  imageIcon({
    required int index,
    required String label,
    required String image,
  }) {
    bool selected = dashBoardIndex == index;
    return GestureDetector(
      onTap: () {
        context.read<DashboardController>().changeDashBoardIndex(index: index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: selected == true ? primaryGradient : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageView(
              height: 24,
              width: 24,
              borderRadiusValue: 0,
              color: Colors.white,
              margin: EdgeInsets.zero,
              fit: BoxFit.contain,
              assetImage: image,
            ),

            // if (selected == true)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fashion_mobile/core/ui/resource/icon_path.dart';
import 'package:fresh_fashion_mobile/core/ui/style/base_color.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:fresh_fashion_mobile/src/feature/cart/presentation/screen/cart_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/home/presentation/screen/home_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/notification/presentation/notification_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/presentation/setting_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];

  void onPageChanged(int page) {
    BlocProvider.of<NavigationBloc>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  PageView _body() {
    return PageView(
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      children: pages,
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 100,
          // color: Colors.amberAccent,
        ),
        Container(
          height: 85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        Container(
          height: 75,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _bottomNavbaritem(
                context,
                defaultIcon: SvgPicture.asset(IconPath.homeInactive),
                choosenIcon: SvgPicture.asset(IconPath.homeActive),
                page: 0,
              ),
              _bottomNavbaritem(
                context,
                defaultIcon: SvgPicture.asset(IconPath.heartInactive),
                choosenIcon: SvgPicture.asset(IconPath.heartActive),
                page: 1,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  gradient: BaseColor.gradient,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {},
                  // icon: SvgPicture.asset(IconPath.search),
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              _bottomNavbaritem(
                context,
                defaultIcon: SvgPicture.asset(IconPath.notificationInactive),
                choosenIcon: SvgPicture.asset(IconPath.notificationActive),
                page: 2,
              ),
              _bottomNavbaritem(
                context,
                defaultIcon: SvgPicture.asset(IconPath.buyInactive),
                choosenIcon: SvgPicture.asset(IconPath.buyActive),
                page: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomNavbaritem(BuildContext context, {required defaultIcon, required choosenIcon, required page}) {
    int currentPage = context.watch<NavigationBloc>().state;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavigationBloc>(context).changeSelectedIndex(page);

        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 10),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      child: Container(
        color: Colors.transparent,
        child: (currentPage == page) ? choosenIcon : defaultIcon,
      ),
    );
  }
}

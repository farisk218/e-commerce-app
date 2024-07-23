import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/assets.dart';
import '../../home/bloc/home_cubit.dart';
import '../../home/screens/home_screen.dart';
import '../../../core/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Widget _getBody(int value) {
    switch (value) {
      case 0:
        return BlocProvider.value(
          value: context.read<HomeCubit>(),
          child: const HomeScreen(),
        );
      // Add other cases as per your app's navigation structure.
      default:
        return BlocProvider.value(
          value: context.read<HomeCubit>(),
          child: const HomeScreen(),
        ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: _getBody(_selectedIndex),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _customBottomNavBar(),
    );
  }

  Widget _customBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: AppColors.primary,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(Assets.homeSelectedIcon),
          activeIcon: _buildIcon(Assets.homeSelectedIcon, isActive: true),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Assets.activitiesSelectedIcon),
          activeIcon: _buildIcon(Assets.activitiesSelectedIcon, isActive: true),
          label: 'Activities',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Assets.cartSelectedIcon),
          activeIcon: _buildIcon(Assets.cartSelectedIcon, isActive: true),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Assets.ordersSelectedIcon),
          activeIcon: _buildIcon(Assets.ordersSelectedIcon, isActive: true),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Assets.profileSelectedIcon),
          activeIcon: _buildIcon(Assets.profileSelectedIcon, isActive: true),
          label: 'My Profile',
        ),
      ],
    );
  }

  Widget _buildIcon(String url, {bool isActive = false}) {
    return SizedBox(
      width: 80.h,
      height: 50.h,
      child: Stack(
        alignment: Alignment.center, // Ensures everything is centered
        children: [
          if (isActive)
            Positioned(
              top: 1,
              child: SizedBox(
                height: 80.h,
                child: SvgPicture.asset(
                  Assets.tabBg,
                  width: 80.w,
                  height: 80.h,
                ),
              ),
            ),
          SizedBox(
            width: 25.w,
            height: isActive ? 25.h : 20.h,
            child: SvgPicture.asset(
              url,
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
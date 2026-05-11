import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/features/dashboard/view/dashboard_screen.dart';
import 'package:vegetarian_super_hero/features/history/view/history_screen.dart';
import 'package:vegetarian_super_hero/features/nav/controller/nav_controller.dart';
import 'package:vegetarian_super_hero/features/plan/view/my_plan_screen.dart';
import 'package:vegetarian_super_hero/features/profile/view/profile_screen.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/features/nav/controller/nav_controller.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NavController ইনজেক্ট করা হচ্ছে
    final controller = Get.put(NavController());

    final List<Widget> _pages = [
      const DashboardScreen(),
      const MyPlanScreen(),
      const HistoryScreen(),
      const ProfileScreen()
    ];

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: _pages[controller.selectedIndex],
        bottomNavigationBar: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: const Color(0xff000000),
            border: Border(
              top: BorderSide(
                color: AppColors.dividerGrey.withValues(alpha: 0.3),
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.darkPrimary,
            unselectedItemColor: AppColors.textGreyMuted,
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkPrimary,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGreyMuted,
            ),
            onTap: (int index) {
              controller.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.grid_view_rounded, 0, controller.selectedIndex),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.assignment_outlined, 1, controller.selectedIndex),
                label: "Plan",
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.access_time_rounded, 2, controller.selectedIndex),
                label: "History",
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.person_outline_rounded, 3, controller.selectedIndex),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index, int selectedIndex) {
    final isSelected = selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: isSelected
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkPrimary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            )
          : null,
      child: Icon(icon, size: 28.r),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetarian_super_hero/features/dashboard/view/dashboard_screen.dart';
import 'package:vegetarian_super_hero/share/widgets/network_image/custom_network_image.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // ValueNotifier ব্যবহার করছি স্টেট ম্যানেজ করার জন্য
  final ValueNotifier<int> _selectedPage = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    const DashboardScreen(),
    const Center(child: Text("Plan Screen", style: TextStyle(color: Colors.white))),
    const Center(child: Text("Progress Screen", style: TextStyle(color: Colors.white))),
    const Center(child: Text("History Screen", style: TextStyle(color: Colors.white))),
    const Center(child: Text("Profile Screen", style: TextStyle(color: Colors.white))),
  ];

  @override
  void dispose() {
    _selectedPage.dispose(); // মেমোরি লিক রোধ করতে ডিসপোজ করছি
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedPage,
      builder: (context, selectedIndex, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: _pages[selectedIndex],
          bottomNavigationBar: Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: const Color(0xff000000),
              border: Border(
                top: BorderSide(
                  color: AppColors.dividerGrey.withOpacity(0.1),
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
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
                _selectedPage.value = index; // এখানে ValueNotifier আপডেট হচ্ছে
              },
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.grid_view_rounded, 0, selectedIndex),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.assignment_outlined, 1, selectedIndex),
                  label: "Plan",
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.trending_up_rounded, 2, selectedIndex),
                  label: "Progress",
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.access_time_rounded, 3, selectedIndex),
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.person_outline_rounded, 4, selectedIndex),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
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

  // Widget _buildProfileIcon(int index, int selectedIndex) {
  //   final isSelected = selectedIndex == index;
  //   return Container(
  //     height: 32.r,
  //     width: 32.r,
  //     decoration: isSelected
  //         ? BoxDecoration(
  //             shape: BoxShape.circle,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: AppColors.darkPrimary.withOpacity(0.3),
  //                 blurRadius: 15,
  //                 spreadRadius: 1,
  //               ),
  //             ],
  //           )
  //         : null,
  //     child: Icon(
  //       Icons.person_outline_rounded,
  //       color: isSelected ? AppColors.darkPrimary : AppColors.textGreyMuted,
  //       size: 28.r,
  //     ),
  //   );
  // }
}

import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const moreIcon = Icon(Icons.more_vert);
  static const dashBoardIcon = BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard',);
  static const addIcon = BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Add',);
  static const logBookIcon = BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: 'Log Book',);
  static const pickDateIcon = Icon(Icons.edit_calendar_outlined, size: 22,);
  static const pickTimeIcon = Icon(Icons.more_time_outlined, size: 22,);
  static const planeIcon = Icon(Icons.flight, color: AppColors.primaryColor);
  static const calendarIcon = Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.primaryColor);
  static const takeOffIcon =  Icon(Icons.flight_takeoff_outlined, size: 12, color: AppColors.primaryColor);
  static const takeDownIcon = Icon(Icons.flight_land_outlined, size: 12, color: AppColors.primaryColor);
  static const filterListIcon = Icon(Icons.filter_list_alt, size: 22, color: AppColors.primaryColor);
}

import 'package:flight_log_book/screens/dashboard_screen.dart';
import 'package:flight_log_book/screens/flight_logbook_screen.dart';
import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flight_log_book/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'add_flight_logbook_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    DashBoardScreen(),
    AddFlightLogbookScreen(),
    FlightLogbookScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: SizedBox(
          child: Text(
            "App Icon",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed: () {}, icon: AppIcons.moreIcon,),
        ],
        elevation: 4,
        shadowColor: AppColors.blackColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      body: _screens[_selectedIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              _selectedIndex = index;
              if (mounted) {
                setState(() {});
              }
            },
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer,
            items: const [
              AppIcons.dashBoardIcon, AppIcons.addIcon, AppIcons.logBookIcon,
            ],
          ),
        ),
      ),

    );
  }


}

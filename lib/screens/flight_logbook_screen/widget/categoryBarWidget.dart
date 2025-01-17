
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CategoryBarWidget extends StatefulWidget {
  const CategoryBarWidget({super.key});

  @override
  State<CategoryBarWidget> createState() => _CategoryBarWidgetState();
}

class _CategoryBarWidgetState extends State<CategoryBarWidget> {
  final List<String> _categoryList = [
    'All',
    'My Logbook',
    'In Progress',
    'Complete'
  ];
  var _selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory == _categoryList[index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0, vertical: 0.0),
              child: Stack(children: [
                Text(
                  _categoryList[index],
                  style: _selectedCategory ==
                      _categoryList[index]
                      ? Theme.of(context).textTheme.displayLarge
                      : Theme.of(context).textTheme.displayMedium!
                      .copyWith(color: AppColors.greyColor),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _selectedCategory ==
                          _categoryList[index]
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                    duration: const Duration(milliseconds: 200),
                    height: _selectedCategory ==
                        _categoryList[index]
                        ? 4
                        : 0,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

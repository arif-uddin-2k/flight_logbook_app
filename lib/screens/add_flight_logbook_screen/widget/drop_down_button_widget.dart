import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownButtonForm extends DropdownButtonFormField2<String> {


  DropdownButtonForm({
    super.key,
    super.isExpanded = true,
    super.decoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.4,
        color: AppColors.primaryColor,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.4,
        color: AppColors.blackColor,
      ),
    ),
    required super.items,
    required super.validator,
    required super.onChanged,
    required super.onSaved,
    super.buttonStyleData = const ButtonStyleData(
      elevation: 4,
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
    ),
    super.iconStyleData = const IconStyleData(
      icon: Icon(
        Icons.arrow_drop_down,
        color: AppColors.primaryColor,
      ),
      iconSize: 24,
    ),
    required super.dropdownStyleData,
    super.menuItemStyleData = const MenuItemStyleData(
      padding: EdgeInsets.all(0),
    ),
  });
}

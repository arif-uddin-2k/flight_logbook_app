import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final List<String> _userTypeList = ['Crew', 'Pilot'];
  String? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height:MediaQuery.of(context).size.height * 0.8 ,
          child: Form(
              child: Column(
            children: [
              // const SizedBox(height: 300),
              SizedBox(
                child: Text(
                  "Registration Form",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.4),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('First Name'),
                        hintText: "John",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('First Name'),
                        hintText: "Doe",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('User Id'),
                        hintText: "FS - 37845",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: _dropDownMenu("User Type", _userTypeList, 1),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    hintText: "example@gmail.com",
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text('Phone'),
                    hintText: "017XXXXXXXX",
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    hintText: "******",
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Confirm Password'),
                    hintText: "******",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                          color: AppColors.whiteColor,
                        ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _dropDownMenu(String? label, List menuItemList, int varToChange) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.42,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
            color: AppColors.primaryColor,
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
            color: AppColors.blackColor,
          ),
          labelText: label,
        ),
        items: menuItemList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select an item.';
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            if (varToChange == 1) _selectedUserType = value.toString();
          });
        },
        onSaved: (value) {
          setState(() {
            if (varToChange == 1) _selectedUserType = value.toString();
          });
        },
        buttonStyleData: const ButtonStyleData(
          elevation: 4,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.primary,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}

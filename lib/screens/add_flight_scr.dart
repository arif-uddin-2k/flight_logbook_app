

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flight_log_book/model/flight_logs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFlightScreen extends StatefulWidget {
  const AddFlightScreen({super.key});

  @override
  State<AddFlightScreen> createState() => _AddFlightScreenState();
}

class _AddFlightScreenState extends State<AddFlightScreen> {
  String? _selectedFlightType;
  String? _selectedACType;
  final List<String> dropDownFlightTypes = ['Shuttle', 'Stay'];
  final List<String> dropDownACTypes = ['B777', 'B787', 'B787-9', 'B737', 'D8'];

  DateTime _flightDate = DateTime.now();
  DateTime _departureTime = DateTime.now();
  DateTime _arrivalTime = DateTime.now();
  DateTime _dutyOnTime = DateTime.now();
  DateTime _dutyOffTime = DateTime.now();
  Duration? _totalFlyHour;

  final TextEditingController _flightNoTEController = TextEditingController();
  final TextEditingController _acRegTEController = TextEditingController();
  final TextEditingController _captainTEController = TextEditingController();
  final TextEditingController _cicTEController = TextEditingController();
  final TextEditingController _fromTEController = TextEditingController();
  final TextEditingController _toTEController = TextEditingController();
  final TextEditingController _logSheetNoTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _addNewFlightInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Date",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: InkWell(
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        _showBottomDatePicker(context);
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.black26),
                        ),
                        child: Center(
                          child: Text(
                              "${_flightDate.day.toString().padLeft(2, '0')}/${_flightDate.month.toString().padLeft(2, '0')}/${_flightDate.year}"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Log Sheet No.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.39,
                    child: TextFormField(
                      controller: _logSheetNoTEController,
                      decoration: const InputDecoration(
                        hintText: "BG-787",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Flight No.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    child: TextFormField(
                      controller: _flightNoTEController,
                      decoration: const InputDecoration(
                        hintText: "BG-787",
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _dropDownMenu(
                      "Flight Type", dropDownFlightTypes, 1),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "A/C Reg.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    child: TextFormField(
                      controller: _acRegTEController,
                      decoration: const InputDecoration(
                        hintText: "S2-",
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _dropDownMenu("A/C Type", dropDownACTypes, 2)
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Captain",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: TextFormField(
                      controller: _captainTEController,
                      decoration: const InputDecoration(
                        hintText: "Name",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "CIC",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: TextFormField(
                      controller: _cicTEController,
                      decoration: const InputDecoration(
                        hintText: "CIC",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "From",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: TextFormField(
                      controller: _fromTEController,
                      decoration: const InputDecoration(
                        hintText: "DAC",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "To",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: TextFormField(
                      controller: _toTEController,
                      decoration: const InputDecoration(
                        hintText: "RUH",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Text(
                      "Departure",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: InkWell(
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        _showBottomTimePicker(context, 0);
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(
                                "${_departureTime.hour.toString().padLeft(2, '0')}:${_departureTime.minute.toString().padLeft(2, '0')}")),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Text(
                      "Arrival",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: InkWell(
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        _showBottomTimePicker(context, 1);
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(

                                "${_arrivalTime.hour.toString().padLeft(2, '0')}:${_arrivalTime.minute.toString().padLeft(2, '0')}")),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Text(
                      "Duty On",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: InkWell(
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        _showBottomTimePicker(context, 2);
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(
                                "${_dutyOnTime.hour.toString().padLeft(2, '0')}:${_dutyOnTime.minute.toString().padLeft(2, '0')}")),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Text(
                      "Duty Off",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: InkWell(
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        _showBottomTimePicker(context, 3);
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(
                                "${_dutyOffTime.hour.toString().padLeft(2, '0')}:${_dutyOffTime.minute.toString().padLeft(2, '0')}")),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: _addNewFlightInProgress == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addNewFlight();
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _showBottomDatePicker(BuildContext context) {
    BottomPicker.date(
      initialDateTime: null,
      pickerTitle: const Text("Pick Your Date"),
      bottomPickerTheme: BottomPickerTheme.blue,
      titlePadding: const EdgeInsets.all(8),
      pickerTextStyle: const TextStyle(
        fontSize: 16,
      ),
      onChange: (value) {
        _flightDate = value;
        setState(() {});
      },
    ).show(context);
  }

  void _showBottomTimePicker(BuildContext context, index) {
    BottomPicker.time(
      pickerTitle: const Text("Pick Your Time"),
      bottomPickerTheme: BottomPickerTheme.blue,
      use24hFormat: true,
      titlePadding: const EdgeInsets.all(8),
      pickerTextStyle: const TextStyle(
        fontSize: 16,
      ),
      onChange: (value) {
        if (index == 0) _departureTime = value;
        if (index == 1) _arrivalTime = value;
        if (index == 2) _dutyOnTime = value;
        if (index == 3) _dutyOffTime = value;
        setState(() {});
      },
      initialTime: null,
    ).show(context);
  }

  Widget _showCupertinoTimePicker(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        initialDateTime: _dutyOffTime,
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (value) {
          _dutyOffTime = value;
          setState(() {});
        },
      ),
    );
  }

  void _addNewFlight() {
    // _addNewFlightInProgress = true;
    // setState(() {});

    if(_departureTime.hour > _arrivalTime.hour || (_departureTime.hour == _arrivalTime.hour && _departureTime.minute > _arrivalTime.minute)) {
      _arrivalTime = _arrivalTime.add(const Duration(days: 1));
    }
    _totalFlyHour = _arrivalTime.difference(_departureTime);


    listSort();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New Flight Logbook Added.'),
      ),
    );

    // _addNewFlightInProgress = false;
    // setState(() {});
  }

  Widget _dropDownMenu(String label, List menuItemList, int varToChange) {
    return SizedBox(
      height: 40,
      width: MediaQuery.sizeOf(context).width * 0.33,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Add more decoration..
        ),
        hint: Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
        items: menuItemList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
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
          if(varToChange == 1) _selectedFlightType = value.toString();
          if(varToChange == 2) _selectedACType = value.toString();
        },
        onSaved: (value) {
          if(varToChange == 1) _selectedFlightType = value.toString();
          if(varToChange == 2) _selectedACType = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _flightNoTEController.dispose();
    _acRegTEController.dispose();
    _captainTEController.dispose();
    _cicTEController.dispose();
    _fromTEController.dispose();
    _toTEController.dispose();
    super.dispose();
  }
}

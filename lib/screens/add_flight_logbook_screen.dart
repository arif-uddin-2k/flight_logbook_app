
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flight_log_book/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AddFlightLogbookScreen extends StatefulWidget {
  const AddFlightLogbookScreen({super.key});

  @override
  State<AddFlightLogbookScreen> createState() => _AddFlightLogbookScreenState();
}

class _AddFlightLogbookScreenState extends State<AddFlightLogbookScreen> {

  final List<String> _dropDownFlightTypes = ['Shuttle', 'Stay'];
  final List<String> _dropDownACTypes = ['B777', 'B787', 'B787-9', 'B737', 'D8'];
  final List<String> _dutyOffTypes = ['SL', 'PR'];

  DateTime _flightDate = DateTime.now();
  DateTime _departureTime = DateTime.now();
  DateTime _arrivalTime = DateTime.now();
  DateTime _dutyOnTime = DateTime.now();
  DateTime _dutyOffTime = DateTime.now();
  Duration? _totalFlyHour;

  final TextEditingController _flightDateTEController = TextEditingController();
  final TextEditingController _dutyOffTypeTEController = TextEditingController();
  final TextEditingController _logBookNoTEController = TextEditingController();
  final TextEditingController _flightNoTEController = TextEditingController();
  final TextEditingController _flightTypeTEController = TextEditingController();
  final TextEditingController _acRegNoTEController = TextEditingController();
  final TextEditingController _acTypeTEController = TextEditingController();
  final TextEditingController _captainNameTEController =
      TextEditingController();
  final TextEditingController _cicTEController = TextEditingController();
  final TextEditingController _fromTEController = TextEditingController();
  final TextEditingController _toTEController = TextEditingController();
  final TextEditingController _departureTimeTEController =
      TextEditingController();
  final TextEditingController _arrivalTimeTEController =
      TextEditingController();
  final TextEditingController _dutyOnTimeTEController = TextEditingController();
  final TextEditingController _dutyOffTimeTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  bool _addNewFlightInProgress = false;
  bool?  _isLeave = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                "Flight Log Form",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "Fill the form to create a new flight log.",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        Divider(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.4),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.42,
                                      child:
                                      TextFormField(
                                        controller: _flightDateTEController,
                                        readOnly: true,
                                        onTap: () {
                                          FocusScope.of(context).requestFocus(FocusNode());
                                          _showCupertinoTimePicker(context, "Select your date", _flightDateTEController, CupertinoDatePickerMode.date, 0);
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Flight Date",
                                          hintText: "DD/MM/YYYY",
                                          suffixIcon: AppIcons.pickDateIcon,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.42,
                                      child: CheckboxListTile(
                                        title: Text(
                                          "Day Off",
                                          style: Theme.of(context).textTheme.displayMedium,
                                        ),
                                          value: _isLeave,
                                          onChanged: (value) {
                                            setState(() {
                                              _isLeave = value;
                                            });
                                          },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Visibility(
                                  visible: _isLeave!,
                                  child: SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.42,
                                    child: _dropDownMenu(
                                        "Day Off", _dutyOffTypes, 3),
                                  ),
                                ),
                                Visibility(
                                  visible: !_isLeave!,
                                    child: _buildFlightLogbookFullForm(),
                                ),
                                const SizedBox(height: 40),
                                Visibility(
                                  visible: _addNewFlightInProgress == false,
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.42,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Theme.of(context).colorScheme.primary,
                                            backgroundColor: Theme.of(context).colorScheme.secondary,
                                          ),
                                          onPressed: () {
                                            //Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                              "Cancel"
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.42,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey1.currentState!.validate()) {}
                                          },
                                          child: const Text("Save"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCupertinoTimePicker(BuildContext context, String title, TextEditingController selectedDateTime, CupertinoDatePickerMode mode, int index) {
     showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 350,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                  child: Text(
                      title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    minimumDate: DateTime.now().subtract(const Duration(days: 365*10),),
                    maximumDate: DateTime.now().add(const Duration(days: 365*10),),
                    mode: mode,
                    use24hFormat: true,
                    onDateTimeChanged: (value) {
                      setState(() {
                        if (index == 0) {
                          _flightDate = value;
                          selectedDateTime.text = DateFormat('dd/MM/yyyy').format(value);
                        }
                        else {
                          if (index == 1) _departureTime = value;
                          if (index == 2) _arrivalTime = value;
                          if (index == 3) _dutyOnTime = value;
                          if (index == 4) _dutyOffTime = value;
                          selectedDateTime.text = DateFormat('HH:mm').format(value);
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Done"
                        ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        elevation: 4,
        backgroundColor: Colors.white,
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
            if (varToChange == 1) _flightTypeTEController.text = value.toString();
            if (varToChange == 2) _acTypeTEController.text = value.toString();
            if (varToChange == 3) _dutyOffTypeTEController.text = value.toString();
          });
        },
        onSaved: (value) {
          setState(() {
            if (varToChange == 1) _flightTypeTEController.text = value.toString();
            if (varToChange == 2) _acTypeTEController.text = value.toString();
            if (varToChange == 3) _dutyOffTypeTEController.text = value.toString();
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

  Widget _buildTextFormField(String? labelText, String? hintText, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.42,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }

  Widget _buildFlightLogbookFullForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        _buildTextFormField("Logbook No.", "BG-787", _logBookNoTEController),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            _buildTextFormField("Flight No.", "BG-787", _flightNoTEController),
            const SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  0.42,
              child: _dropDownMenu("Flight Type",
                  _dropDownFlightTypes, 1),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            _buildTextFormField("A/C Reg. No.", "S2-787", _acRegNoTEController),
            const SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  0.42,
              child: _dropDownMenu(
                  "A/C Type", _dropDownACTypes, 2),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            _buildTextFormField("Captain Name", "Cap. Arif", _captainNameTEController),
            const SizedBox(width: 8),
            _buildTextFormField("CIC", "CIC", _cicTEController),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            _buildTextFormField("From", "DAC", _fromTEController),
            const SizedBox(width: 8),
            _buildTextFormField("To", "RUH", _toTEController),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  0.42,
              child:
              TextFormField(
                controller: _departureTimeTEController,
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showCupertinoTimePicker(context, "Select your time", _departureTimeTEController, CupertinoDatePickerMode.time, 1);
                },
                decoration: const InputDecoration(
                  labelText: "Departure",
                  hintText: "09:30",
                  suffixIcon: AppIcons.pickTimeIcon,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  0.42,
              child: TextFormField(
                controller: _arrivalTimeTEController,
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showCupertinoTimePicker(context, "Select your time", _arrivalTimeTEController, CupertinoDatePickerMode.time, 2);
                },
                decoration: const InputDecoration(
                  labelText: "Arrival",
                  hintText: "12:30",
                  suffixIcon: AppIcons.pickTimeIcon,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  0.42,
              child: TextFormField(
                controller: _dutyOnTimeTEController,
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showCupertinoTimePicker(context, "Select your time", _dutyOnTimeTEController, CupertinoDatePickerMode.time, 3);
                },
                decoration: const InputDecoration(
                  labelText: "Duty On",
                  hintText: "8:30",
                  suffixIcon: AppIcons.pickTimeIcon,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  0.42,
              child: TextFormField(
                controller: _dutyOffTimeTEController ,
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showCupertinoTimePicker(context, "Select your time", _dutyOffTimeTEController, CupertinoDatePickerMode.time, 4);
                },
                decoration: const InputDecoration(
                  labelText: "Duty Off",
                  hintText: "13:30",
                  suffixIcon: AppIcons.pickTimeIcon,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

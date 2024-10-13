import 'package:flight_log_book/model/demo.dart';
import 'package:flight_log_book/model/flight_logs.dart';
import 'package:flight_log_book/screens/app_alert_dialog.dart';
import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flight_log_book/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightLogbookScreen extends StatefulWidget {
  const FlightLogbookScreen({super.key});

  @override
  State<FlightLogbookScreen> createState() => _FlightLogbookScreenState();
}

class _FlightLogbookScreenState extends State<FlightLogbookScreen> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  final TextEditingController _startDateTeController = TextEditingController();
  final TextEditingController _endDateTeController = TextEditingController();

  final List<String> _categoryList = [
    'All',
    'My Logbook',
    'In Progress',
    'Complete'
  ];
   String _selectedCategory = 'All';

  bool filterData = false;
  UniqueKey keyTile = UniqueKey();
  bool _isExpanded = false;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: TextFormField(
                            controller: _startDateTeController,
                            readOnly: true,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _showCupertinoTimePicker(
                                  context,
                                  "Select your date",
                                  _startDateTeController,
                                  CupertinoDatePickerMode.date,
                                  0);
                            },
                            decoration: const InputDecoration(
                              labelText: "From",
                              hintText: "DD/MM/YYYY",
                              suffixIcon: AppIcons.pickDateIcon,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: TextFormField(
                            controller: _endDateTeController,
                            readOnly: true,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _showCupertinoTimePicker(
                                  context,
                                  "Select your date",
                                  _endDateTeController,
                                  CupertinoDatePickerMode.date,
                                  0);
                            },
                            decoration: const InputDecoration(
                              labelText: "To",
                              hintText: "DD/MM/YYYY",
                              suffixIcon: AppIcons.pickDateIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory == _categoryList[index].toString();
                              print(_selectedCategory);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0.0),
                            child: Stack(children: [
                              Text(
                                _categoryList[index],
                                style: _selectedCategory == _categoryList[index]
                                    ? Theme.of(context).textTheme.displayLarge
                                    : Theme.of(context)
                                        .textTheme
                                        .displayLarge!
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
                                  height:
                                      _selectedCategory == _categoryList[index]
                                          ? 4
                                          : 0,
                                  // color: _selectedCategory == _categoryList[index] ? AppColors.primaryColor : Colors.transparent,
                                ),
                              ),
                            ]),
                          ));
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (filterData)
                      _showFilteredFlightLogbook(context)
                    else
                      _showFilteredFlightLogbook(context),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCupertinoTimePicker(
      BuildContext context,
      String title,
      TextEditingController selectedDateTime,
      CupertinoDatePickerMode mode,
      int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, right: 16, bottom: 16),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(
                height: 240,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime.now().subtract(
                    const Duration(days: 365 * 10),
                  ),
                  maximumDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                  mode: mode,
                  use24hFormat: true,
                  onDateTimeChanged: (value) {
                    setState(() {
                      if (index == 0) _startDate = value;
                      if (index == 1) _endDate = value;
                      selectedDateTime.text =
                          DateFormat('dd/MM/yyyy').format(value);
                      filterData = true;
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
                    child: const Text("Done"),
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

  Widget _showNotFilteredFlightLogbook(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
        shrinkWrap: true,
        primary: true,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        itemCount: demoList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 4),
              GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                            child: AppIcons.planeIcon,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${demoList[index].from}-${demoList[index].to}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    demoList[index].flightNo,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  AppIcons.calendarIcon,
                                  Text(
                                    " ${demoList[index].flightDate}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  AppIcons.takeOffIcon,
                                  Text(
                                    " ${demoList[index].departure}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  const SizedBox(width: 16),
                                  AppIcons.takeDownIcon,
                                  Text(
                                    " ${demoList[index].arrival}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                demoList[index].totalFlyHour,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                demoList[index].flightType,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                demoList[index].acType,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onLongPress: () {
                  showAlertDialog(index);
                },
              ),
              const SizedBox(height: 4),
            ],
          );
        },
      ),
    );
  }

  Widget _showFilteredFlightLogbook(BuildContext context) {

    void isExpanded() {
      setState(() {
        _isExpanded = true;
        keyTile = UniqueKey();
      });
    }

    void isShrinked() {
      setState(() {
        _isExpanded = false;
        keyTile = UniqueKey();
      });
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
        shrinkWrap: true,
        primary: true,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        itemCount: demoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      dividerTheme:
                          const DividerThemeData(color: Colors.transparent)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(top: 16),
                        child: Row(
                          children: [
                            AppIcons.planeIcon,
                            const SizedBox(width: 16),
                            Text(
                              'QR 0641',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Departure Information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  'Fri, 11 Oct 24',
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '10:55',
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'DAC',
                                      style: Theme.of(context).textTheme.displayMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    AppIcons.takeOffIcon,
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),

                            // Duration and airline logo in the middle
                            Column(
                              children: [
                                const SizedBox(height: 12),
                                Text('5h 50m',
                                    style: Theme.of(context).textTheme.displaySmall
                                ),
                              ],
                            ),

                            // Arrival Information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  'Fri, 11 Oct 24',
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '13:45',
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    AppIcons.takeDownIcon,
                                    const SizedBox(width: 8),
                                    Text(
                                      'DOH',
                                      style: Theme.of(context).textTheme.displayMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpansionTile(
                          key: keyTile,
                          initiallyExpanded: _isExpanded,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          expandedAlignment: Alignment.centerLeft,
                          title: Text(
                            "See More",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Aircraft Reg. - S2787',
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Aircraft Type - B787',
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Captain - Capt. Akram',
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'CIC - CIC. Ahsanul',
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showAlertDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return AppAlertDialog(
            title: "Quick Choice:",
            content:
                "Would you like to edit this item or delete it permanently?",
            orientation: orientation,
          );
        });
      },
    );
  }
}

class CategoryContent extends StatelessWidget {
  final String category;

  const CategoryContent({required this.category});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Content for $category',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

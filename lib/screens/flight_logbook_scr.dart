import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flight_log_book/screens/app_alert_dialog.dart';
import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flight_log_book/model/flight_logs.dart';

class FlightLogbookScreen extends StatefulWidget {
  const FlightLogbookScreen({super.key});

  @override
  State<FlightLogbookScreen> createState() => _FlightLogbookScreenState();
}

class _FlightLogbookScreenState extends State<FlightLogbookScreen> {
  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //height: MediaQuery.of(context).size.height,
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                            child: Text(
                              "From",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: InkWell(
                              splashColor: Colors.white,
                              hoverColor: Colors.white,
                              highlightColor: Colors.white,
                              onTap: () {
                                _showBottomDatePicker(context, 0);
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
                                        "${_fromDate.day.toString().padLeft(2, '0')}/${_fromDate.month.toString().padLeft(2, '0')}/${_fromDate.year}")),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                            child: Text(
                              "To",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: InkWell(
                              splashColor: Colors.white,
                              hoverColor: Colors.white,
                              highlightColor: Colors.white,
                              onTap: () {
                                _showBottomDatePicker(context, 1);
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
                                        "${_toDate.day.toString().padLeft(2, '0')}/${_toDate.month.toString().padLeft(2, '0')}/${_toDate.year}")),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Date : 23/07/2024",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: flightLogsList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.15,
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.airplanemode_active_outlined,
                                            color: Colors.black38,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${flightLogsList[index].from}-${flightLogsList[index].to}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  flightLogsList[index].flightNo,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.date_range,
                                                  size: 12,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  "12/05/24",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.flight_takeoff_outlined,
                                                  color: Colors.blue,
                                                  size: 12,
                                                ),
                                                Text(
                                                  " ${flightLogsList[index].departure.hour.toString().padLeft(2, '0')}:${flightLogsList[index].departure.minute.toString().padLeft(2, '0')}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                const SizedBox(width: 8),
                                                const Icon(
                                                  Icons.flight_land_outlined,
                                                  color: Colors.blue,
                                                  size: 12,
                                                ),
                                                Text(
                                                  " ${flightLogsList[index].arrival.hour.toString().padLeft(2, '0')}:${flightLogsList[index].arrival.minute.toString().padLeft(2, '0')}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.23,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "12/05/24",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            Text(
                                              flightLogsList[index].flightType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              flightLogsList[index].acType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onLongPress: () {
                                showAlertDialog(index);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                //side: const BorderSide(color: Colors.black26),
              ),
              onPressed: () {},
              child: const Icon(Icons.download),
            ),
          ),
        ],
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

  void _showBottomDatePicker(BuildContext context, index) {
    BottomPicker.date(
      pickerTitle: const Text("Pick Your Time"),
      bottomPickerTheme: BottomPickerTheme.blue,
      titlePadding: const EdgeInsets.all(8),
      pickerTextStyle: const TextStyle(
        fontSize: 16,
      ),
      onChange: (value) {
        if (index == 0) _fromDate = value;
        if (index == 1) _toDate = value;
        setState(() {});
      },
    ).show(context);
  }
}

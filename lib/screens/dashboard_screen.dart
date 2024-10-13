
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Card(
                color: AppColors.thirdColor,
                child: Row(
                  children: [
                     SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.58,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ahsanul Kabir",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4
                              ),
                          ),
                          Text("FS - 3454443",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text("Cabin Crew",
                              style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text("Biman Bangladesh Airlines",
                              style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: IconButton(
                              icon: const Icon(Icons.edit_note),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Card(
                color: AppColors.thirdColor,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text("Total Hours",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(width: 8,),
                    Text(
                        "220",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(width: 8,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //inverted selection button bar
                          AnimatedButtonBar(
                            radius: 8.0,
                            padding: const EdgeInsets.all(16.0),
                            invertedSelection: true,
                            children: [
                              ButtonBarEntry(onTap: () {}, child: Text('Day', style: Theme.of(context).textTheme.titleSmall,),),
                              ButtonBarEntry(onTap: () {}, child: Text('Week', style: Theme.of(context).textTheme.titleSmall,),),
                              ButtonBarEntry(onTap: () {}, child: Text('Month', style: Theme.of(context).textTheme.titleSmall,),),
                              ButtonBarEntry(onTap: () {}, child: Text('Year', style: Theme.of(context).textTheme.titleSmall,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.airplanemode_active_outlined,
                                      size: 32,
                                    ),
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
                                            "DAC-RUS",
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "BG-787",
                                            style: Theme.of(context).textTheme.titleMedium,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.flight_takeoff_outlined,
                                            size: 12,
                                          ),
                                          Text(
                                            " 9:50",
                                            style: Theme.of(context).textTheme.titleSmall,
                                          ),
                                          const SizedBox(width: 8),
                                          const Icon(
                                            Icons.flight_land_outlined,
                                            size: 12,
                                          ),
                                          Text(
                                            " 12:15",
                                            style: Theme.of(context).textTheme.titleSmall,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 12,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            " Ahsanul Kabir",
                                            style: Theme.of(context).textTheme.titleSmall,
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.23,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "2:25",
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      Text(
                                        "Shuttle",
                                        style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                      Text(
                                        "B787",
                                        style: Theme.of(context).textTheme.titleSmall,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

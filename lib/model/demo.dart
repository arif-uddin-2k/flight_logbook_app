class Demo {
  String logSheetNo, flightNo, flightType, acReg, acType, captain, cic, from, to;
  DateTime flightDate, departure, arrival, dutyOn, dutyOff;
  String totalFlyHour;

  Demo({
    required this.flightDate,
    required this.logSheetNo,
    required this.flightNo,
    required this.flightType,
    required this.acReg,
    required this.acType,
    required this.captain,
    required this.cic,
    required this.from,
    required this.to,
    required this.departure,
    required this.arrival,
    required this.dutyOn,
    required this.dutyOff,
    required this.totalFlyHour,
  });
}
Demo demo = Demo(
  flightDate: DateTime.now(),
  logSheetNo: "2332",
  flightNo: "BG-787",
  flightType: "Stay",
  acReg: "ac-4876",
  acType: "B787",
  captain: "Cap. Arif",
  cic: "cic-8946",
  from: "DAC",
  to: "RUH",
  departure: DateTime.now().add(Duration(days: 2)),
  arrival: DateTime.now(),
  dutyOn: DateTime.now(),
  dutyOff: DateTime.now(),
  totalFlyHour: "02:20",
);

List<Demo> demoList = [demo, demo, demo, demo, demo, demo];


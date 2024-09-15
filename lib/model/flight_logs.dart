class FlightLog {
  String logSheetNo, flightNo, flightType, acReg, acType, captain, cic, from, to;
  DateTime flightDate, departure, arrival, dutyOn, dutyOff;
  Duration totalFlyHour;

  FlightLog({
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

List<FlightLog> flightLogsList = [];
void listSort() {
  flightLogsList.sort((FlightLog f1, FlightLog f2) => f1.flightDate.compareTo(f2.flightDate));
}
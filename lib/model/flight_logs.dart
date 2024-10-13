class FlightLog {
  // Private attributes
  String _logSheetNo;
  String _flightNo;
  String _flightType;
  String _acReg;
  String _acType;
  String _captain;
  String _cic;
  String _from;
  String _to;
  DateTime _departure;
  DateTime _arrival;
  double _totalFlyHour;

  // Constructor with required fields
  FlightLog({
    required String logSheetNo,
    required String flightNo,
    required String flightType,
    required String acReg,
    required String acType,
    required String captain,
    required String cic,
    required String from,
    required String to,
    required DateTime departure,
    required DateTime arrival,
    required double totalFlyHour,
  })  : _logSheetNo = logSheetNo,
        _flightNo = flightNo,
        _flightType = flightType,
        _acReg = acReg,
        _acType = acType,
        _captain = captain,
        _cic = cic,
        _from = from,
        _to = to,
        _departure = departure,
        _arrival = arrival,
        _totalFlyHour = totalFlyHour;

  // Getters and setters for each attribute
  String get logSheetNo => _logSheetNo;
  set logSheetNo(String value) => _logSheetNo = value;

  String get flightNo => _flightNo;
  set flightNo(String value) => _flightNo = value;

  String get flightType => _flightType;
  set flightType(String value) => _flightType = value;

  String get acReg => _acReg;
  set acReg(String value) => _acReg = value;

  String get acType => _acType;
  set acType(String value) => _acType = value;

  String get captain => _captain;
  set captain(String value) => _captain = value;

  String get cic => _cic;
  set cic(String value) => _cic = value;

  String get from => _from;
  set from(String value) => _from = value;

  String get to => _to;
  set to(String value) => _to = value;

  DateTime get departure => _departure;
  set departure(DateTime value) => _departure = value;

  DateTime get arrival => _arrival;
  set arrival(DateTime value) => _arrival = value;

  double get totalFlyHour => _totalFlyHour;
  set totalFlyHour(double value) => _totalFlyHour = value;
}


List<FlightLog> flightLogsList = [];
void listSort() {
  flightLogsList.sort((FlightLog f1, FlightLog f2) => f1.departure.compareTo(f2.departure));
}

import 'package:flight_log_book/model/flight_logs.dart';
import 'package:flight_log_book/model/users.dart';

class UsersFlightLog extends FlightLog {
  late String _status;
  late DateTime _dutyOn;
  late DateTime _dutyOff;

  // Named constructor with required fields
  UsersFlightLog({
    required super.logSheetNo,
    required super.flightNo,
    required super.flightType,
    required super.acReg,
    required super.acType,
    required super.captain,
    required super.cic,
    required super.from,
    required super.to,
    required super.departure,
    required super.arrival,
    required super.totalFlyHour,
    required DateTime dutyOn,
    required DateTime dutyOff,
    required String status,
  })  : _dutyOn = dutyOn,
        _dutyOff = dutyOff,
        _status = status;


  // Getters and Setters
  String get status => _status;
  set status(String value) => _status = value;

  DateTime get dutyOn => _dutyOn;
  set dutyOn(DateTime value) => _dutyOn = value;

  DateTime get dutyOff => _dutyOff;
  set dutyOff(DateTime value) => _dutyOff = value;
}

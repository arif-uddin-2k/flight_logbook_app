import 'package:flight_log_book/model/userFlightLogs.dart';

class User {
  late String _userId;
  late String _userEmail;
  late String _userPhoneNumber;
  late String _userPassword;
  late String _userType;

  List<UsersFlightLog> _usersFlightLogList = [];

  // Named constructor with required fields
  User({
    required String userEmail,
    required String userPhoneNumber,
    required String userPassword,
    required String userType,
  })  : _userEmail = userEmail,
        _userPhoneNumber = userPhoneNumber,
        _userPassword = userPassword,
        _userType = userType;

  // functions
  void addUsersFlightLog(UsersFlightLog usersFlightLogbook) {
    _usersFlightLogList.add(usersFlightLogbook);
  }

  // Getters and Setters
  String get userId => _userId;
  set userId(String value) => _userId = value;

  String get userEmail => _userEmail;
  set userEmail(String value) => _userEmail = value;

  String get userPhoneNumber => _userPhoneNumber;

  set userPhoneNumber(String value) => _userPhoneNumber = value;

  String get userPassword => _userPassword;
  set userPassword(String value) => _userPassword = value;

  String get userType => _userType;
  set userType(String value) => _userType = value;

  List<UsersFlightLog> get usersFlightLogList => _usersFlightLogList;

  set usersFlightLogList(List<UsersFlightLog> value) {
    _usersFlightLogList = value;
  }
}

import 'package:flight_log_book/model/userFlightLogs.dart';

class _UserAuthInfo {
  late String _userId;
  late String _userEmail;
  late String _userPassword;
  late String _userType;

  List<UsersFlightLog>? _usersFlightLogList;

  // Named constructor with required fields
  _UserAuthInfo({
    required String userId,
    required String userEmail,
    required String userPassword,
    required String userType,
  })  : _userId = userId,
        _userEmail = userEmail,
        _userPassword = userPassword,
        _userType = userType;

  // functions
  void addUsersFlightLog(UsersFlightLog usersFlightLogbook) {
    _usersFlightLogList?.add(usersFlightLogbook);
  }

  // Getters and Setters
  List<UsersFlightLog>? get usersFlightLogbookList =>
      _usersFlightLogList;

  String get userId => _userId;
  set userId(String value) => _userId = value;

  String get userEmail => _userEmail;
  set userEmail(String value) => _userEmail = value;

  String get userPassword => _userPassword;
  set userPassword(String value) => _userPassword = value;

  String get userType => _userType;
  set userType(String value) => _userType = value;
}

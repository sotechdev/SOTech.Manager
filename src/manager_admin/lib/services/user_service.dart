import 'package:flutter/material.dart';
import 'package:manager_admin/models/user.dart';

class UserService extends ValueNotifier {
  UserService._() : super(null);

  static final UserService _instance = UserService._();

  User? _loggedUser;
  bool get isLogged => _loggedUser != null;

  factory UserService() {
    return _instance;
  }

  void setUser(User? user) {
    if (user != _loggedUser) {
      _loggedUser = user;
      notifyListeners();
    }
  }
}

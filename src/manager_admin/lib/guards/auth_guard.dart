import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:manager_admin/services/user_service.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  final userService = UserService();

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return userService.isLogged;
  }
}

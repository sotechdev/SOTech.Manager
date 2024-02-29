import 'package:flutter_modular/flutter_modular.dart';
import 'package:manager_admin/guards/auth_guard.dart';
import 'package:manager_admin/pages/home_page.dart';
import 'package:manager_admin/pages/login_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child('/', child: (context) => const HomePage(), guards: [AuthGuard()]);
    r.child('/login', child: (context) => const LoginPage());
  }
}

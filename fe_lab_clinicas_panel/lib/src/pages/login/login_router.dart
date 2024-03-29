import 'package:fe_lab_clinicas_panel/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../../repository/user/user_repository.dart';
import '../../repository/user/user_repository_impl.dart';
import '../../services/login/user_login_services.dart';
import '../../services/login/user_login_services_impl.dart';
import 'login_controller.dart';

class LoginRouter extends FlutterGetItPageRouter {
  const LoginRouter({super.key});
  @override
  String get routeName => '/login';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
            (i) => UserRepositoryImpl(restClient: i())),
        Bind.lazySingleton<UserLoginServices>(
            (i) => UserLoginServicesImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController(loginServices: i())),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}

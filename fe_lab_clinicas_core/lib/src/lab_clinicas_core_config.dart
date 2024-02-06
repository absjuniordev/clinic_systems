// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:fe_lab_clinicas_core/src/theme/lab_clinicas_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    Key? key,
    this.binding,
    this.pages,
    this.pagesBuilder,
    this.modules,
    required this.title,
  }) : super(key: key);

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilder;
  final List<FlutterGetItModule>? modules;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      modules: modules,
      pages: [...pages ?? [], ...pagesBuilder ?? []],
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigatorObserver) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LabClinicasTheme.lightThem,
              darkTheme: LabClinicasTheme.darkTheme,
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver,
              ],
              routes: routes,
              title: title,
            );
          },
        );
      },
    );
  }
}

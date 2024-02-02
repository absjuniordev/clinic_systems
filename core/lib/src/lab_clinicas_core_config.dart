// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    Key? key,
    this.binding,
    this.pages,
    this.pagesBuilder,
    this.modulos,
    required this.title,
  }) : super(key: key);

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilder;
  final List<FlutterGetItModule>? modulos;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      pages: [...pages ?? [], ...pagesBuilder ?? []],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          navigatorObservers: [flutterGetItNavObserver],
          title: title,
          routes: routes,
        );
      },
    );
  }
}

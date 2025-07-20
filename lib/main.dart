import 'package:flutter/material.dart';
import 'package:listaai/appwidget.dart';
import 'package:listaai/global/services/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Inject.instance.init();

  runApp(const Appwidget());
}

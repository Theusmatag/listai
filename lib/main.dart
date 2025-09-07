import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listaai/appwidget.dart';
import 'package:listaai/firebase_options.dart';
import 'package:listaai/global/services/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  await Inject.instance.init();

  FirebaseAnalytics.instance.logEvent(name: 'test_event');

  runApp(const Appwidget());
}

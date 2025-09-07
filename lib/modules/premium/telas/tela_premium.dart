import 'package:flutter/material.dart';

class TelaPremium extends StatefulWidget {
  const TelaPremium({super.key});

  @override
  State<TelaPremium> createState() => _TelaPremiumState();
}

class _TelaPremiumState extends State<TelaPremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Premium'),));
  }
}

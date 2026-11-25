import 'package:btsystem/transit_map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TransitMapApp());
}

class TransitMapApp extends StatelessWidget {
  const TransitMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color(0xFF131D24)),
      home: const TransitMapScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class TrafficPill extends StatelessWidget {
  final String? trafficDelay;
  const TrafficPill({this.trafficDelay, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8A65).withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        trafficDelay!,
        style: const TextStyle(color: Color(0xFFFF8A65), fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}

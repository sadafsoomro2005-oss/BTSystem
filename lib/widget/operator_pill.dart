import 'package:flutter/material.dart';

class OperatorPill extends StatelessWidget {
  final String operatorName;
  final Color operatorBadgeColor;
  const OperatorPill({required this.operatorName, required this.operatorBadgeColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: operatorBadgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        operatorName,
        style: TextStyle(color: operatorBadgeColor, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}

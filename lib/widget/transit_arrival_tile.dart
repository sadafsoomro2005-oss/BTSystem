import 'package:btsystem/widget/operator_pill.dart';
import 'package:btsystem/widget/traffic_pill.dart';
import 'package:flutter/material.dart';

import 'badge_pill.dart';

class TransitArrivalTile extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onTap;
  final String operatorName;
  final String lineCode;
  final Color operatorBadgeColor;
  final String? trafficDelay;
  final String subtitle;
  final String etaMinutes;
  final String nextStopTitle;
  final String nextStopDistance;
  final String stopsRemaining;

  const TransitArrivalTile({
    required this.isExpanded,
    required this.onTap,
    required this.operatorName,
    required this.lineCode,
    required this.operatorBadgeColor,
    this.trafficDelay,
    required this.subtitle,
    required this.etaMinutes,
    this.nextStopTitle = '86th St & Amsterdam (Your Stop)',
    this.nextStopDistance = '1.2 km away',
    this.stopsRemaining = '2 stops to\nDest',
    super.key,
  });

  @override
  State<TransitArrivalTile> createState() => _TransitArrivalTileState();
}

class _TransitArrivalTileState extends State<TransitArrivalTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color(0xFF141B22),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.isExpanded ? widget.operatorBadgeColor : Colors.white.withValues(alpha: 0.06),
            width: widget.isExpanded ? 2.0 : 1.0,
          ),
        ),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 220),
          crossFadeState: widget.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: collapsedView(),
          secondChild: expandedView(),
        ),
      ),
    );
  }

  Widget collapsedView() {
    return Row(
      children: [
        // Flush Left Vertical Accent Bar
        if (!widget.isExpanded) ...[
          Container(width: 4, height: 55, color: widget.operatorBadgeColor),
          const SizedBox(width: 3),
        ],
        // ---------------- Left square batch ------------------
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFF131A21),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.operatorName,
                style: TextStyle(color: widget.operatorBadgeColor, fontSize: 10, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                widget.lineCode,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        // ---------------- Middle Route & Traffic Details ------------------
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // operator and traffic
              Row(
                children: [
                  Text(
                    widget.lineCode,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 6),
                  OperatorPill(operatorName: widget.operatorName, operatorBadgeColor: widget.operatorBadgeColor),
                  if (widget.trafficDelay != null) ...[
                    const SizedBox(width: 6),
                    // Traffic Pill
                    TrafficPill(trafficDelay: widget.trafficDelay),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              // location
              Text(
                widget.subtitle,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Right ETA
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              widget.etaMinutes,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 2),
            const Text('min', style: TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        ),
      ],
    );
  }

  Widget expandedView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // logo
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(color: widget.operatorBadgeColor, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.operatorName,
                    style: const TextStyle(color: Color(0xFF0D1419), fontSize: 10, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.lineCode,
                    style: const TextStyle(color: Color(0xFF0D1419), fontSize: 13, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            BadgePill(
              lineCode: widget.lineCode,
              text: 'OPERATOR: ${widget.operatorName}',
              color: widget.operatorBadgeColor,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                  Text(
                    widget.etaMinutes,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 2),
                  const Text('min', style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],),
                Text(
                  "ETA: 08:34 AM",
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        // Next
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(color: const Color(0xFF1C252E), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              const Icon(Icons.arrow_forward, color: Color(0xFF64B5F6), size: 18),
              const SizedBox(width: 5),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, height: 1.35),
                    children: [
                      const TextSpan(
                        text: 'Next: ',
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextSpan(
                        text: widget.nextStopTitle,
                        style: const TextStyle(color: Color(0xFF00E676), fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' • ${widget.nextStopDistance}',
                        style: const TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                widget.stopsRemaining,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.white60, fontSize: 11.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        // track
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Start Turn-by-Turn Tracking
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.operatorBadgeColor,
                  foregroundColor: const Color(0xFF0D1419),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.near_me_outlined, size: 18),
                label: Text(
                  'Tracking ${widget.operatorName} ${widget.lineCode} (Turn-by-Turn)',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF00E676).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF00E676).withValues(alpha: 0.5)),
              ),
              child: IconButton(
                onPressed: () {
                  // TODO: Add to Watchlist alerts
                },
                icon: const Icon(Icons.notifications_active_outlined, color: Color(0xFF00E676), size: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

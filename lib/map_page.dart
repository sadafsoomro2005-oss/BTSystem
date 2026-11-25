import 'package:btsystem/widget/transit_arrival_tile.dart';
import 'package:flutter/material.dart';

import 'constants/image_strings.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int? _expandedIndex; // or 0

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* --------------- Simulated Map Background & Transit Route --------------- */
        Image.asset(ImageStrings.map, fit: BoxFit.fitHeight, height: MediaQuery.of(context).size.height),

        /* --------------- Top Search Bar --------------- */
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF283138).withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Destination, stop, or operator (e.g. EMU',
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.mic, size: 22),
                ],
              ),
            ),
          ),
        ),

        /* --------------- Modal bottom draggable scrollable sheet --------------- */
        DraggableScrollableSheet(
          initialChildSize: 0.20, // Starts collapsed showing ~3-4 items
          minChildSize: 0.10, // Minimum collapsed height (header only)
          maxChildSize: 0.50, // Expanded height when dragged up
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B242D),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.45), blurRadius: 16, offset: const Offset(0, -4)),
                ],
              ),
              child: Column(
                children: [
                  /* --------------- Handle and title --------------- */
                  SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        // Drag Handle
                        Center(
                          child: Container(
                            width: 38,
                            height: 4,
                            margin: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2)),
                          ),
                        ),
                        // Sheet header
                        const Row(
                          children: [
                            Icon(Icons.directions_bus_filled_outlined, color: Color(0xFF00E676), size: 22),
                            SizedBox(width: 8),
                            Text(
                              'Approaching Your Stop',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                      children: [
                        // Transit arrival items
                        TransitArrivalTile(
                          isExpanded: _expandedIndex == 0,
                          onTap: () => setState(() => _expandedIndex = (_expandedIndex == 0) ? null : 0),
                          operatorName: 'EMU',
                          lineCode: 'Line 1',
                          operatorBadgeColor: Color(0xFF00E676),
                          subtitle: '86th St & Amsterdam (Your Stop) • 1.2 km away',
                          etaMinutes: '3',
                        ),
                        const Divider(color: Colors.white10, height: 20),
                        TransitArrivalTile(
                          isExpanded: _expandedIndex == 1,
                          onTap: () => setState(() => _expandedIndex = (_expandedIndex == 1) ? null : 1),
                          operatorName: 'ITIMAT',
                          lineCode: 'ITI145',
                          operatorBadgeColor: Color(0xFF64B5F6),
                          trafficDelay: '+2m Traffic',
                          subtitle: 'To Hudson Yards Pier • 3.8 km away',
                          etaMinutes: '9',
                        ),
                        Divider(color: Colors.white10, height: 20),
                        TransitArrivalTile(
                          isExpanded: _expandedIndex == 2,
                          onTap: () => setState(() => _expandedIndex = (_expandedIndex == 2) ? null : 2),
                          operatorName: 'ITIMAT',
                          lineCode: 'ITI163',
                          operatorBadgeColor: Color(0xFF64B5F6),
                          trafficDelay: '+2m Traffic',
                          subtitle: 'To Hudson Yards Pier • 3.8 km away',
                          etaMinutes: '25',
                        ),
                        Divider(color: Colors.white10, height: 20),
                        TransitArrivalTile(
                          isExpanded: _expandedIndex == 3,
                          onTap: () => setState(() => _expandedIndex = (_expandedIndex == 3) ? null : 3),
                          operatorName: 'EMU',
                          lineCode: 'Line 2',
                          operatorBadgeColor: Color(0xFF00E676),
                          subtitle: 'To 145th St Terminal • 5.1 km away',
                          etaMinutes: '14',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

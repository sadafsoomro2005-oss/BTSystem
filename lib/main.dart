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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF131D24),
      ),
      home: const TransitMapScreen(),
    );
  }
}

class TransitMapScreen extends StatefulWidget {
  const TransitMapScreen({super.key});

  @override
  State<TransitMapScreen> createState() => _TransitMapScreenState();
}

class _TransitMapScreenState extends State<TransitMapScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Simulated Map Background & Transit Route
          // Positioned.fill(
          //   child: CustomPaint(
          //     painter: _SimulatedMapPainter(),
          //   ),
          // ),

          // 2. Floating Transit Labels & Callouts
          // const _MapCalloutsLayer(),

          // 3. Top Search Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF283138).withOpacity(0.95),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white70, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Destination, stop, or operator (e.g. EMU',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.mic, color: Colors.white70, size: 22),
                  ],
                ),
              ),
            ),
          ),

          // 4. Bottom-Right Map Controls (Layers & Recenter)
          Positioned(
            right: 16,
            bottom: 24,
            child: Column(
              children: [
                // _MapActionButton(
                //   icon: Icons.layers_outlined,
                //   iconColor: Colors.white,
                //   onTap: () {},
                // ),
                const SizedBox(height: 12),
                // _MapActionButton(
                //   icon: Icons.my_location,
                //   iconColor: const Color(0xFF00E676),
                //   onTap: () {},
                // ),
              ],
            ),
          ),
        ],
      ),

      // 5. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF131D24),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00E676),
        unselectedItemColor: Colors.white70,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar_outlined),
            label: 'Console',
          ),
        ],
      ),
    );
  }
}

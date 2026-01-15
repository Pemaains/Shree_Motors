// lib/screens/vehicles/kama_ev_ew2_screen.dart
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';

class KamaEvEw2Screen extends StatelessWidget {
  const KamaEvEw2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Text('Kama EV EW2 Page - Coming Soon'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

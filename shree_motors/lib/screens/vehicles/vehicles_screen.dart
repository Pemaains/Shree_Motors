// ========================================
// lib/screens/vehicles/vehicles_screen.dart
// ========================================
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Text('Vehicles Page - Coming Soon'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

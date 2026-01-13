// ========================================
// lib/screens/compare/compare_screen.dart
// ========================================
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Text('Compare Models Page - Coming Soon'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

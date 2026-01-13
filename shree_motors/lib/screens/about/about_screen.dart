// ========================================
// lib/screens/about/about_screen.dart
// ========================================
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Text('About Us Page - Coming Soon'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

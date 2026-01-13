// ========================================
// lib/screens/contact/contact_screen.dart
// ========================================
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Text('Contact Us Page - Coming Soon'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

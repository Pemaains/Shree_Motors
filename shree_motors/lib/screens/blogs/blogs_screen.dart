// ========================================
// lib/screens/blogs/blogs_screen.dart
// ========================================
import 'package:flutter/material.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: Text('Blogs Page - Coming Soon'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

// lib/widgets/home/testimonials_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 80,
      ),
      color: AppColors.secondary,
      child: Column(
        children: [
          Text(
            'TESTIMONIALS',
            style: AppTextStyles.h2.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 60),
          const Text(
            'Customer testimonials - Coming Soon',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

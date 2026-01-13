// lib/widgets/home/vehicle_highlights_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class VehicleHighlightsSection extends StatelessWidget {
  const VehicleHighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 80,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'VEHICLE HIGHLIGHTS',
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: 16),
          Text(
            'Power. Precision. Performance—everything you need in one electric workhorse.',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Highlights Section - Coming Soon'),
          ),
        ],
      ),
    );
  }
}

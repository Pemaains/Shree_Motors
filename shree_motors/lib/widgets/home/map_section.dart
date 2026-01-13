// lib/widgets/home/map_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: AppColors.lightGray,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 80, color: AppColors.mediumGray),
            SizedBox(height: 16),
            Text(
              'Google Maps Integration - Coming Soon',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.mediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

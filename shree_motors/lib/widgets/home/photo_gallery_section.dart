// lib/widgets/home/photo_gallery_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class PhotoGallerySection extends StatelessWidget {
  const PhotoGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 80,
      ),
      color: AppColors.white,
      child: Column(
        children: [
          Text(
            'PHOTO GALLERY',
            style: AppTextStyles.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildFilterButton('ALL', true),
              _buildFilterButton('KAMA EV EW1', true),
              _buildFilterButton('KAMA EV EW2', true),
              _buildFilterButton('EV VAN', true),
            ],
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: Responsive.gridColumns(context),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: List.generate(6, (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightGray,
                ),
                child: const Center(
                  child:
                      Icon(Icons.image, size: 48, color: AppColors.mediumGray),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, bool isActive) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? AppColors.primary : AppColors.white,
        foregroundColor: isActive ? AppColors.white : AppColors.textPrimary,
        side: BorderSide(
            color: isActive ? AppColors.primary : AppColors.lightGray),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label),
    );
  }
}

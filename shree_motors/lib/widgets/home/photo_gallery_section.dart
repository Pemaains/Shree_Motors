// lib/widgets/home/photo_gallery_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class PhotoGallerySection extends StatefulWidget {
  const PhotoGallerySection({super.key});

  @override
  State<PhotoGallerySection> createState() => _PhotoGallerySectionState();
}

class _PhotoGallerySectionState extends State<PhotoGallerySection> {
  String _selectedFilter = 'ALL';

  final List<Map<String, String>> _galleryItems = [
    {
      'image': 'assets/images/home/hero_vehicles.png',
      'category': 'KAMA EV EW1',
    },
    {
      'image': 'assets/images/home/vehicle_blue_showroom.png',
      'category': 'KAMA EV EW2',
    },
    {
      'image': 'assets/images/home/vehicle_ew1_white.png',
      'category': 'EV VAN',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: isMobile ? 60 : 100,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'PHOTO ',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                  ),
                ),
                TextSpan(
                  text: 'GALLERY',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Filter Buttons
          Wrap(
            spacing: 0,
            alignment: WrapAlignment.center,
            children: [
              _buildFilterButton('ALL'),
              _buildFilterButton('KAMA EV EW1'),
              _buildFilterButton('KAMA EV EW2'),
              _buildFilterButton('EV VAN'),
            ],
          ),

          const SizedBox(height: 60),

          // Gallery Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = Responsive.gridColumns(context);
              final itemWidth =
                  (constraints.maxWidth - (columns - 1) * 20) / columns;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: _galleryItems
                    .where((item) =>
                        _selectedFilter == 'ALL' ||
                        item['category'] == _selectedFilter)
                    .map((item) => _buildGalleryItem(item, itemWidth))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String filter) {
    final isSelected = _selectedFilter == filter;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGray,
          ),
        ),
        child: Text(
          filter,
          style: AppTextStyles.button.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryItem(Map<String, String> item, double width) {
    return Container(
      width: width,
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              item['image']!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.lightGray.withValues(alpha: 0.3),
                  child: const Icon(
                    Icons.electric_car,
                    size: 60,
                    color: AppColors.primary,
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  item['category']!,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

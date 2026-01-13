// lib/widgets/home/hero_section.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';
import '../../core/routes/app_routes.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> _images = [
    'assets/images/home/hero_vehicles.png',
    'assets/images/home/vehicle_blue_showroom.png',
    'assets/images/home/vehicle_white_boxes.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      height: isMobile ? 600 : (isTablet ? 500 : 600),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF87CEEB).withValues(alpha: 0.3),
            const Color(0xFFE0F6FF).withValues(alpha: 0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Background Image Slider
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.lightGray.withValues(alpha: 0.3),
                    child: const Icon(
                      Icons.electric_car,
                      size: 100,
                      color: AppColors.primary,
                    ),
                  );
                },
              );
            },
          ),

          // Navigation Arrows
          if (!isMobile) ...[
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 40),
                  color: Colors.white,
                  onPressed: () {
                    _pageController.previousPage(
                      duration: AppConstants.mediumAnimation,
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 40),
                  color: Colors.white,
                  onPressed: () {
                    _pageController.nextPage(
                      duration: AppConstants.mediumAnimation,
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
          ],

          // Content Overlay
          Positioned(
            top: isMobile ? 40 : 80,
            right: isMobile ? 20 : 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Our mission ',
                      style: AppTextStyles.h5.copyWith(
                        fontSize: isMobile ? 16 : 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextSpan(
                      text: 'zero Emission!',
                      style: AppTextStyles.h5.copyWith(
                        fontSize: isMobile ? 16 : 20,
                        color: AppColors.white,
                        backgroundColor: AppColors.accent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Info Card
          Positioned(
            left: isMobile ? 20 : 80,
            top: isMobile ? 120 : 180,
            child: Container(
              width: isMobile ? (MediaQuery.of(context).size.width - 40) : 450,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Kama EV',
                    style: AppTextStyles.h2.copyWith(
                      fontSize: isMobile ? 32 : 42,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Available now at Shree Motors, Kathmandu, Nepal',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildStat('260+', 'KM Range'),
                      Container(
                        width: 1,
                        height: 40,
                        color: AppColors.lightGray,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      _buildStat('3', 'Models'),
                      Container(
                        width: 1,
                        height: 40,
                        color: AppColors.lightGray,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      _buildStat('4', 'Colors'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '25.90 Lakhs',
                        style: AppTextStyles.price.copyWith(
                          fontSize: isMobile ? 28 : 36,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.go(AppRoutes.contact);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 32,
                            vertical: isMobile ? 14 : 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          'BOOK NOW!',
                          style: AppTextStyles.button.copyWith(
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.h3.copyWith(
            color: AppColors.primary,
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

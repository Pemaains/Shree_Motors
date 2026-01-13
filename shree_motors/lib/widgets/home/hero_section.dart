// lib/widgets/home/hero_section.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int _currentSlide = 0;

  final List<String> _vehicleImages = [
    'assets/images/home/vehicle1.png',
    'assets/images/home/vehicle2.png',
    'assets/images/home/vehicle3.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      height: screenHeight * 0.85,
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        image: const DecorationImage(
          image: AssetImage('assets/images/home/hero_bg.jpg'),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Stack(
        children: [
          // Mission Statement - Top Right
          Positioned(
            top: 40,
            right: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    'Our mission ',
                    style: AppTextStyles.h5.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'zero Emission!',
                      style: AppTextStyles.h5.copyWith(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2, end: 0),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.padding(context),
            ),
            child: Row(
              children: [
                // Left Side - Text Content
                Expanded(
                  flex: isDesktop ? 2 : 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vehicle Info Card
                      Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.mainVehicle,
                              style: AppTextStyles.h1.copyWith(
                                fontSize: isDesktop ? 56 : 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                .animate()
                                .fadeIn(duration: 800.ms)
                                .slideY(begin: 0.3, end: 0),

                            const SizedBox(height: 16),

                            Text(
                              'Available now at Shree Motors, Kathmandu, Nepal',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 200.ms)
                                .slideY(begin: 0.2, end: 0),

                            const SizedBox(height: 32),

                            // Stats Row
                            Row(
                              children: [
                                _buildStatItem(
                                  '${AppConstants.kmRange}+',
                                  'KM Range',
                                ),
                                const SizedBox(width: 40),
                                _buildStatItem(
                                  '${AppConstants.modelCount}',
                                  'Models',
                                ),
                                const SizedBox(width: 40),
                                _buildStatItem(
                                  '${AppConstants.colorCount}',
                                  'Colors',
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 400.ms)
                                .slideY(begin: 0.2, end: 0),

                            const SizedBox(height: 40),

                            // Price and CTA
                            Row(
                              children: [
                                Text(
                                  AppConstants.vehiclePrice,
                                  style: AppTextStyles.price.copyWith(
                                    fontSize: isDesktop ? 48 : 32,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'BOOK NOW!',
                                    style: AppTextStyles.button.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 600.ms)
                                .slideY(begin: 0.2, end: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Side - Vehicle Carousel
                if (isDesktop)
                  Expanded(
                    flex: 3,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 500,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentSlide = index;
                          });
                        },
                      ),
                      items: _vehicleImages.map((imagePath) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                          ),
                        );
                      }).toList(),
                    )
                        .animate()
                        .fadeIn(duration: 1000.ms, delay: 400.ms)
                        .slideX(begin: 0.3, end: 0),
                  ),
              ],
            ),
          ),

          // Navigation Arrows
          if (isDesktop) ...[
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.chevron_left, size: 48),
                  color: AppColors.white,
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.chevron_right, size: 48),
                  color: AppColors.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.stat.copyWith(
            fontSize: 36,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

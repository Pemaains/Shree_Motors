// lib/widgets/home/hero_section.dart
import 'package:flutter/material.dart';
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
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final List<String> _vehicleImages = [
    'assets/images/home/vehicle_blue_showroom.png',
    'assets/images/home/hero_vehicles.png',
    'assets/images/home/vehicle_ew1_white.png',
  ];

  @override
  void initState() {
    super.initState();
    // Auto-play
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _autoPlay();
      }
    });
  }

  void _autoPlay() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted && _pageController.hasClients) {
        final nextPage = (_currentPage + 1) % _vehicleImages.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        _autoPlay();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      height: screenHeight * 0.85,
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
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
                    style: AppTextStyles.h5.copyWith(fontSize: 20),
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
                            Row(
                              children: [
                                _buildStatItem(
                                    '${AppConstants.kmRange}+', 'KM Range'),
                                const SizedBox(width: 40),
                                _buildStatItem(
                                    '${AppConstants.modelCount}', 'Models'),
                                const SizedBox(width: 40),
                                _buildStatItem(
                                    '${AppConstants.colorCount}', 'Colors'),
                              ],
                            )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 400.ms)
                                .slideY(begin: 0.2, end: 0),
                            const SizedBox(height: 40),
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
                                    style: AppTextStyles.button
                                        .copyWith(fontSize: 18),
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

                // Right Side - Vehicle Carousel (Custom PageView)
                if (isDesktop)
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 500,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: _vehicleImages.length,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (_pageController.position.haveDimensions) {
                                value = _pageController.page! - index;
                                value =
                                    (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                              }
                              return Center(
                                child: SizedBox(
                                  height:
                                      Curves.easeInOut.transform(value) * 500,
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                _vehicleImages[index],
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.lightGray,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.directions_car,
                                        size: 100,
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 1000.ms, delay: 400.ms)
                        .slideX(begin: 0.3, end: 0),
                  ),
              ],
            ),
          ),

          // Page Indicators
          if (isDesktop)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _vehicleImages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.primary
                          : AppColors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
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

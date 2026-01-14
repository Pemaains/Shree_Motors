// lib/widgets/common/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/image_helper.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Bar with Contact Info
          if (Responsive.isDesktop(context))
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.padding(context),
                vertical: 12,
              ),
              color: AppColors.lightGray.withValues(alpha: 0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.phone,
                          size: 16, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        AppConstants.phone,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 32),
                      const Icon(Icons.email,
                          size: 16, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        AppConstants.email,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        '${AppConstants.city}, ${AppConstants.country}',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.facebook),
                      _buildSocialIcon(Icons.close), // Twitter/X
                      _buildSocialIcon(Icons.g_mobiledata), // Google+
                      _buildSocialIcon(Icons.business), // LinkedIn
                    ],
                  ),
                ],
              ),
            ),

          // Main Navigation Bar - FIXED LAYOUT
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.padding(context),
              vertical: 16,
            ),
            child: Row(
              children: [
                // Logo with Image - FIXED
                InkWell(
                  onTap: () => context.go(AppRoutes.home),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageAssets.logo,
                        height: 150,
                        width: 150,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.electric_car,
                              color: AppColors.primary,
                              size: 30,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),

                const Spacer(),

                // Navigation Links
                if (Responsive.isDesktop(context))
                  Row(
                    children: [
                      _buildNavItem(context, 'Home', AppRoutes.home),
                      _buildNavItem(context, 'Vehicles', AppRoutes.vehicles),
                      _buildNavItem(
                          context, 'Compare Models', AppRoutes.compare),
                      _buildNavItem(context, 'Support', AppRoutes.support),
                      _buildNavItem(context, 'About Us', AppRoutes.about),
                      _buildNavItem(context, 'Contact Us', AppRoutes.contact),
                      _buildNavItem(context, 'Blogs', AppRoutes.blogs),
                    ],
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _showMobileMenu(context);
                    },
                  ),

                const SizedBox(width: 16),

                // CTA Button
                ElevatedButton(
                  onPressed: () {
                    context.go(AppRoutes.contact);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'SCHEDULE VISIT',
                    style: AppTextStyles.button,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final active = currentRoute == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => context.go(route),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.navLink.copyWith(
              color: active ? AppColors.primary : AppColors.textPrimary,
              fontWeight: active ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Icon(icon, size: 14, color: AppColors.mediumGray),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMobileMenuItem(context, 'Home', AppRoutes.home),
            _buildMobileMenuItem(context, 'Vehicles', AppRoutes.vehicles),
            _buildMobileMenuItem(context, 'Compare Models', AppRoutes.compare),
            _buildMobileMenuItem(context, 'Support', AppRoutes.support),
            _buildMobileMenuItem(context, 'About Us', AppRoutes.about),
            _buildMobileMenuItem(context, 'Contact Us', AppRoutes.contact),
            _buildMobileMenuItem(context, 'Blogs', AppRoutes.blogs),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(
      BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}

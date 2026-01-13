// lib/widgets/common/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';
import '../../core/routes/app_routes.dart';

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
                      _buildSocialIcon(Icons.add_box), // Google+
                      _buildSocialIcon(Icons.business), // LinkedIn
                    ],
                  ),
                ],
              ),
            ),

          // Main Navigation Bar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.padding(context),
              vertical: 16,
            ),
            child: Row(
              children: [
                // Logo
                Row(
                  children: [
                    Container(
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
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.companyName.toUpperCase(),
                          style: AppTextStyles.h5.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Text(
                          'Pvt. Ltd.',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // Navigation Links
                if (Responsive.isDesktop(context))
                  Row(
                    children: [
                      _buildNavItem(context, 'Home', AppRoutes.home, true),
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
                      // TODO: Implement mobile menu
                    },
                  ),

                const SizedBox(width: 16),

                // CTA Button
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement schedule visit
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
                  child: Text(
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

  Widget _buildNavItem(BuildContext context, String title, String route,
      [bool isActive = false]) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final active = currentRoute == route || isActive;

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
}

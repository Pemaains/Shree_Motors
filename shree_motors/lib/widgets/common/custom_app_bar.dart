// lib/widgets/common/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/image_helper.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isVehiclesHovered = false;

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

          // Main Navigation Bar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.padding(context),
              vertical: 16,
            ),
            child: Row(
              children: [
                // Logo
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
                      _buildVehiclesDropdown(context),
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

  // VEHICLES DROPDOWN
  Widget _buildVehiclesDropdown(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final active =
        currentRoute.contains('/vehicles') || currentRoute.contains('/kama-ev');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isVehiclesHovered = true),
        onExit: (_) => setState(() => _isVehiclesHovered = false),
        child: Column(
          children: [
            Container(
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
                'Vehicles',
                style: AppTextStyles.navLink.copyWith(
                  color: active ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            if (_isVehiclesHovered)
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDropdownItem(
                        context,
                        'Kama EV EW1',
                        AppRoutes.kamaEvEw1,
                      ),
                      Container(
                        height: 1,
                        color: AppColors.mediumGray.withValues(alpha: 0.3),
                      ),
                      _buildDropdownItem(
                        context,
                        'Kama EV EW2',
                        AppRoutes.kamaEvEw2,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(BuildContext context, String title, String route) {
    return InkWell(
      onTap: () {
        setState(() => _isVehiclesHovered = false);
        context.go(route);
      },
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
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
            _buildMobileMenuItem(context, 'Kama EV EW1', AppRoutes.kamaEvEw1),
            _buildMobileMenuItem(context, 'Kama EV EW2', AppRoutes.kamaEvEw2),
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

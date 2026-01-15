// lib/screens/vehicles/kama_ev_ew1_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/image_helper.dart';
import '../../core/routes/app_routes.dart';

class KamaEvEw1Screen extends StatelessWidget {
  const KamaEvEw1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            _buildHeroSection(context),
            _buildBreadcrumb(context),
            _buildFeaturesSection(context),
            _buildTestDriveSection(context),
            _buildQuickLinksSection(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      height: isMobile ? 400 : 600,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkGray,
            AppColors.mediumGray.withValues(alpha: 0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Hero Image
          Positioned.fill(
            child: Image.asset(
              ImageAssets.kamaElectric,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.lightGray.withValues(alpha: 0.3),
                  child: const Center(
                    child: Icon(
                      Icons.electric_car,
                      size: 100,
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
            ),
          ),

          // Title Overlay
          Positioned(
            top: isMobile ? 80 : 150,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.padding(context),
              ),
              child: Column(
                children: [
                  Text(
                    'KAMA EV EW1 – THE FUTURE OF PICKUP IN',
                    style: AppTextStyles.h1.copyWith(
                      fontSize: isMobile ? 24 : 48,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'NEPAL - SHREE MOTORS NEPAL',
                    style: AppTextStyles.h1.copyWith(
                      fontSize: isMobile ? 24 : 48,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 20,
      ),
      color: AppColors.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => context.go(AppRoutes.home),
            child: Text(
              'Home',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text('/'),
          const SizedBox(width: 8),
          Text(
            'Kama EV EW1 - The Future of Pickup in Nepal',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: isMobile ? 60 : 100,
      ),
      color: AppColors.white,
      child: Column(
        children: [
          // Main Vehicle Image
          Container(
            constraints: BoxConstraints(
              maxHeight: isMobile ? 300 : 500,
              maxWidth: 1200,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                ImageAssets.heroVehicles,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.lightGray.withValues(alpha: 0.3),
                    child: const Center(
                      child: Icon(
                        Icons.electric_car,
                        size: 100,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 60),

          // Feature Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = Responsive.gridColumns(context);
              final itemWidth =
                  (constraints.maxWidth - (columns - 1) * 20) / columns;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildFeatureCard(
                    itemWidth,
                    ImageAssets.vehicleBlueFarm,
                    'भारी लोड?',
                    'अब NO TENSION !',
                  ),
                  _buildFeatureCard(
                    itemWidth,
                    ImageAssets.vehicleWhiteBoxes,
                    'जहाँ पनि जानुहोस्',
                    '280+ Km\nFULL CHARGE\nRANGE',
                  ),
                  _buildFeatureCard(
                    itemWidth,
                    ImageAssets.vehicleCharging,
                    'AC/DC',
                    'FAST CHARGING',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      double width, String imagePath, String title, String subtitle) {
    return Container(
      width: width,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
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
            // Overlay
            Container(
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
            ),
            // Text
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestDriveSection(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: isMobile ? 60 : 80,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'Book a FREE Test Drive Today',
            style: AppTextStyles.h2.copyWith(
              fontSize: isMobile ? 28 : 42,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Call 9851408880 or visit Shree Motors now!',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () async {
              final uri = Uri.parse('tel:${AppConstants.phone}');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 32 : 48,
                vertical: isMobile ? 16 : 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.phone, size: 24),
            label: Text(
              'Call Now',
              style: AppTextStyles.button.copyWith(
                fontSize: isMobile ? 16 : 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinksSection(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: isMobile ? 60 : 80,
      ),
      color: AppColors.white,
      child: isMobile
          ? Column(
              children: [
                _buildQuickLinks(),
                const SizedBox(height: 40),
                _buildLatestNews(),
                const SizedBox(height: 40),
                _buildYouTubeEmbed(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildQuickLinks()),
                const SizedBox(width: 60),
                Expanded(child: _buildLatestNews()),
                const SizedBox(width: 60),
                Expanded(child: _buildYouTubeEmbed()),
              ],
            ),
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUICK LINKS',
          style: AppTextStyles.h5.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildLink('Service'),
        _buildLink('FAQ'),
        _buildLink('About Us'),
        _buildLink('Privacy policy'),
        _buildLink('Support'),
        _buildLink('Contact Us'),
      ],
    );
  }

  Widget _buildLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildLatestNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LATEST NEWS',
          style: AppTextStyles.h5.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EV Preventive Maintenance: ...',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Just like traditional fuel-powered trucks ...',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                'Jul 10, 2025',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYouTubeEmbed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.darkGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_circle_fill,
                  size: 60,
                  color: Colors.red.shade700,
                ),
                const SizedBox(height: 12),
                Text(
                  'Kama EV Ew1 2024',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// lib/widgets/home/map_section.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        // Map Container
        Container(
          width: double.infinity,
          height: isMobile ? 400 : 500,
          color: AppColors.lightGray.withValues(alpha: 0.3),
          child: Stack(
            children: [
              // Placeholder for Google Maps
              // You'll need to implement Google Maps here
              Container(
                color: const Color(0xFFE5E5E5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.map,
                        size: 80,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Map Loading...',
                        style: AppTextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lat: ${AppConstants.latitude}, Lng: ${AppConstants.longitude}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),

              // Info Overlay
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: isMobile
                        ? (MediaQuery.of(context).size.width - 40)
                        : 900,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: isMobile
                        ? Column(
                            children: [
                              _buildInfoItem(
                                Icons.location_on,
                                'Ravi Bhawan',
                                'Kalimati, Kathmandu, Nepal',
                              ),
                              const SizedBox(height: 20),
                              _buildInfoItem(
                                Icons.email,
                                'Send Mail',
                                AppConstants.email,
                              ),
                              const SizedBox(height: 20),
                              _buildInfoItem(
                                Icons.phone,
                                'Call us',
                                AppConstants.phone,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: _buildInfoItem(
                                  Icons.location_on,
                                  'Ravi Bhawan',
                                  'Kalimati, Kathmandu, Nepal',
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: AppColors.lightGray,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                              Expanded(
                                child: _buildInfoItem(
                                  Icons.email,
                                  'Send Mail',
                                  AppConstants.email,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: AppColors.lightGray,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                              Expanded(
                                child: _buildInfoItem(
                                  Icons.phone,
                                  'Call us',
                                  AppConstants.phone,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Call to Action Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.padding(context),
            vertical: isMobile ? 40 : 60,
          ),
          color: AppColors.darkGray,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Call Directly',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.white,
                        fontSize: isMobile ? 24 : 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Call Shree Motors Directly – Urgent EV Inquiries & Immediate Assistance',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white.withValues(alpha: 0.8),
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile) const SizedBox(width: 40),
              OutlinedButton(
                onPressed: () async {
                  final uri = Uri.parse('tel:${AppConstants.phone}');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.white, width: 2),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 40,
                    vertical: isMobile ? 14 : 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  'CALL NOW!',
                  style: AppTextStyles.button.copyWith(
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        // MD Contact Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.padding(context),
            vertical: isMobile ? 60 : 100,
          ),
          color: AppColors.white,
          child: isMobile
              ? Column(
                  children: [
                    _buildMDImage(),
                    const SizedBox(height: 40),
                    _buildMDInfo(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildMDImage()),
                    const SizedBox(width: 80),
                    Expanded(child: _buildMDInfo(context)),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMDImage() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/about/md_sushant_chand.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.lightGray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: AppColors.primary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMDInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'For Inquiry',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textLight,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'CONTACT ',
                style: AppTextStyles.h2.copyWith(
                  fontSize: 36,
                ),
              ),
              TextSpan(
                text: 'ME',
                style: AppTextStyles.h2.copyWith(
                  fontSize: 36,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Contact Form
        TextField(
          decoration: InputDecoration(
            hintText: 'Full Name',
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Email Address',
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Message',
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Handle send
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkGray,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text('Send'),
        ),
      ],
    );
  }
}

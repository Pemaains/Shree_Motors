// lib/widgets/home/about_vehicle_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class AboutVehicleSection extends StatelessWidget {
  const AboutVehicleSection({super.key});

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
                  text: 'ABOUT',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                  ),
                ),
                TextSpan(
                  text: 'VEHICLE',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isMobile ? double.infinity : 900,
            child: Text(
              'The Kama EV EW1 is designed to power your business with strength, efficiency, and sustainability. Whether you\'re transporting farm goods, making urban deliveries, or running a small business, this all-electric pickup is built to support your everyday operations with confidence.',
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: Responsive.fontSize(context, 18),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildSpecCard(
                context,
                Icons.calendar_today,
                'MODEL YEAR',
                '2024',
              ),
              _buildSpecCard(
                context,
                Icons.person,
                'SEATING CAPACITY',
                '2',
              ),
              _buildSpecCard(
                context,
                Icons.access_time,
                'CHARGING TIME',
                '8-10 hrs',
              ),
              _buildSpecCard(
                context,
                Icons.open_in_full,
                'CARGO BED SIZE',
                '10FT',
                highlighted: true,
              ),
              _buildSpecCard(
                context,
                Icons.settings,
                'MOTOR POWER',
                '70 KW',
              ),
              _buildSpecCard(
                context,
                Icons.local_shipping,
                'LOAD CAPACITY',
                '1.5 Tons',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecCard(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    bool highlighted = false,
  }) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: isMobile ? (MediaQuery.of(context).size.width / 2 - 40) : 180,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: highlighted ? AppColors.primary : AppColors.lightGray,
          width: highlighted ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: highlighted
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Transform.rotate(
            angle: highlighted ? 0.785398 : 0, // 45 degrees in radians
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: highlighted
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.lightGray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 32,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.h3.copyWith(
              fontSize: 28,
              color: highlighted ? AppColors.primary : AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// lib/widgets/home/about_vehicle_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class AboutVehicleSection extends StatelessWidget {
  const AboutVehicleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 80,
      ),
      color: AppColors.white,
      child: Column(
        children: [
          Text(
            'ABOUT',
            style: AppTextStyles.overline.copyWith(
              color: AppColors.primary,
              letterSpacing: 2,
            ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 8),
          Text(
            'VEHICLE',
            style: AppTextStyles.h2.copyWith(
              fontSize: isDesktop ? 36 : 28,
            ),
          ).animate().fadeIn(duration: 600.ms, delay: 100.ms),
          const SizedBox(height: 40),
          Text(
            'The Kama EV EW1 is designed to power your business with strength, efficiency, and sustainability. Whether you\'re transporting farm goods, making urban deliveries, or running a small business, this all-electric pickup is built to support your everyday operations with confidence.',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildSpecItem(Icons.calendar_today, 'MODEL YEAR', '2024'),
              _buildSpecItem(Icons.person, 'SEATING CAPACITY', '2'),
              _buildSpecItem(Icons.access_time, 'CHARGING TIME', '8-10 hrs'),
              _buildSpecItem(Icons.unfold_more, 'CARGO BED SIZE', '10FT'),
              _buildSpecItem(Icons.settings, 'MOTOR POWER', '70 KW'),
              _buildSpecItem(Icons.car_rental, 'LOAD CAPACITY', '1.5 Tons'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecItem(IconData icon, String label, String value) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: AppTextStyles.overline.copyWith(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.h4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).scale();
  }
}

// lib/widgets/home/vehicle_specs_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class VehicleSpecsSection extends StatelessWidget {
  const VehicleSpecsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 80,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'VEHICLES SPECS',
            style: AppTextStyles.h2.copyWith(
              fontSize: isDesktop ? 36 : 28,
            ),
          ),
          const SizedBox(height: 60),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.directions_car,
                          size: 80, color: AppColors.mediumGray),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(child: _buildSpecsList()),
              ],
            )
          else
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.directions_car,
                        size: 60, color: AppColors.mediumGray),
                  ),
                ),
                const SizedBox(height: 40),
                _buildSpecsList(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSpecsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comfort meets utility in a cabin built to drive your business forward.',
          style: AppTextStyles.bodyLarge,
        ),
        const SizedBox(height: 30),
        _buildSpecRow('Steering:', 'Power Steering'),
        _buildSpecRow('Seating Capacity:', '2 Persons'),
        _buildSpecRow('Dashboard:', 'Digital Meter Display'),
        _buildSpecRow('Cabin Type:', 'Enclosed Ventilated Cabin'),
        _buildSpecRow('USB Charging Port:', 'Available'),
        _buildSpecRow('Interior Material:', 'Durable Plastic Finish'),
        _buildSpecRow('Sun Visor:', 'Yes'),
        _buildSpecRow('Air Conditioning:', 'Not Available'),
        _buildSpecRow('Cabin Lights:', 'LED Interior Light'),
      ],
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyMedium,
                children: [
                  TextSpan(
                    text: '$label ',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

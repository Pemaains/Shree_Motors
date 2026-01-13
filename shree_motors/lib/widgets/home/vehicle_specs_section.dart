// lib/widgets/home/vehicle_specs_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class VehicleSpecsSection extends StatefulWidget {
  const VehicleSpecsSection({super.key});

  @override
  State<VehicleSpecsSection> createState() => _VehicleSpecsSectionState();
}

class _VehicleSpecsSectionState extends State<VehicleSpecsSection> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: isMobile ? 60 : 100,
      ),
      color: AppColors.white,
      child: Column(
        children: [
          Text(
            'VEHICLES SPECS',
            style: AppTextStyles.h2.copyWith(
              fontSize: Responsive.fontSize(context, 42),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Tabs
          Wrap(
            spacing: 0,
            children: [
              _buildTab('CABIN & INTERIOR', 0),
              _buildTab('BUILD & EXTERIOR', 1),
            ],
          ),

          const SizedBox(height: 60),

          // Content
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildVehicleImage(),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: _buildSpecsContent(),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildVehicleImage(),
                const SizedBox(height: 40),
                _buildSpecsContent(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTab == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGray,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.button.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleImage() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF001f3f),
            const Color(0xFF003366),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/home/vehicle_blue_farm.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.electric_car,
              size: 100,
              color: Colors.white54,
            );
          },
        ),
      ),
    );
  }

  Widget _buildSpecsContent() {
    if (_selectedTab == 0) {
      return _buildCabinInteriorSpecs();
    } else {
      return _buildBuildExteriorSpecs();
    }
  }

  Widget _buildCabinInteriorSpecs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comfort meets utility in a cabin built to drive your business forward.',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 32),
        _buildSpecRow('Steering :', 'Power Steering'),
        _buildSpecRow('Seating Capacity :', '2 Persons'),
        _buildSpecRow('Dashboard :', 'Digital Meter Display'),
        _buildSpecRow('Cabin Type :', 'Enclosed Ventilated Cabin'),
        _buildSpecRow('USB Charging Port :', 'Available'),
        _buildSpecRow('Interior Material :', 'Durable Plastic Finish'),
        _buildSpecRow('Sun Visor :', 'Yes'),
        _buildSpecRow('Air Conditioning :', 'Not Available'),
        _buildSpecRow('Cabin Lights :', 'LED Interior Light'),
      ],
    );
  }

  Widget _buildBuildExteriorSpecs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Built tough for demanding work, designed smart for everyday use.',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 32),
        _buildSpecRow('Body Type :', 'Pickup Truck'),
        _buildSpecRow('Cargo Bed Length :', '10 Feet'),
        _buildSpecRow('Load Capacity :', '1.5 Tons'),
        _buildSpecRow('Ground Clearance :', 'High'),
        _buildSpecRow('Suspension :', 'Heavy-duty'),
        _buildSpecRow('Wheels :', 'Steel Rims'),
        _buildSpecRow('Headlights :', 'LED'),
        _buildSpecRow('Paint Quality :', 'Industrial Grade'),
      ],
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check,
            color: AppColors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$label ',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
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

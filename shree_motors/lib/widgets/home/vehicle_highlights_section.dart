//lib/widgets/home/vehicle_highlights_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';

class VehicleHighlightsSection extends StatefulWidget {
  const VehicleHighlightsSection({super.key});

  @override
  State<VehicleHighlightsSection> createState() =>
      _VehicleHighlightsSectionState();
}

class _VehicleHighlightsSectionState extends State<VehicleHighlightsSection> {
  int _selectedTab = 1; // Default to "WHEELS & TIRES"

  final List<Map<String, dynamic>> _tabs = [
    {'id': 0, 'label': 'MOTOR POWER'},
    {'id': 1, 'label': 'WHEELS & TIRES'},
    {'id': 2, 'label': 'GROUND CLEARANCE'},
    {'id': 3, 'label': 'SUSPENSION'},
    {'id': 4, 'label': 'LOAD SPACE'},
    {'id': 5, 'label': 'CHARGING'},
    {'id': 6, 'label': 'TURNING RADIUS'},
  ];

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
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'VEHICLE',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                  ),
                ),
                TextSpan(
                  text: 'HIGHLIGHTS',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Power. Precision. Performance—everything you need in one electric workhorse.',
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: Responsive.fontSize(context, 16),
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Tabs
          if (isDesktop)
            Wrap(
              spacing: 0,
              children: _tabs
                  .map((tab) => _buildTab(tab['label'], tab['id']))
                  .toList(),
            )
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs
                    .map((tab) => _buildTab(tab['label'], tab['id']))
                    .toList(),
              ),
            ),

          const SizedBox(height: 60),

          // Content
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildHighlightImage(),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: _buildHighlightContent(),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildHighlightImage(),
                const SizedBox(height: 40),
                _buildHighlightContent(),
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightImage() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Image.asset(
        _getImageForTab(),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 400,
            decoration: BoxDecoration(
              color: AppColors.lightGray.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
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
    );
  }

  String _getImageForTab() {
    switch (_selectedTab) {
      case 0:
        return 'assets/images/home/vehicle_blue_showroom.png';
      case 1:
        return 'assets/images/home/vehicle_blue_farm.png';
      case 2:
        return 'assets/images/home/vehicle_white_boxes.png';
      case 3:
        return 'assets/images/home/vehicle_blue_retail.png';
      case 4:
        return 'assets/images/home/vehicle_load_capacity.png';
      case 5:
        return 'assets/images/home/vehicle_charging.png';
      case 6:
        return 'assets/images/home/vehicle_range.png';
      default:
        return 'assets/images/home/wheels_tyres.png';
    }
  }

  Widget _buildHighlightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _getTitle(),
          style: AppTextStyles.h3.copyWith(
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _getDescription(),
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 32),
        ..._getSpecs().map((spec) => _buildSpecItem(spec)),
      ],
    );
  }

  String _getTitle() {
    switch (_selectedTab) {
      case 0:
        return 'Motor Power';
      case 1:
        return 'Wheels & Tires';
      case 2:
        return 'Ground Clearance';
      case 3:
        return 'Suspension';
      case 4:
        return 'Load Space';
      case 5:
        return 'Charging';
      case 6:
        return 'Turning Radius';
      default:
        return 'Wheels & Tires';
    }
  }

  String _getDescription() {
    switch (_selectedTab) {
      case 0:
        return 'Powerful 70 KW motor delivering reliable performance for all your business needs.';
      case 1:
        return 'Fitted with radial tires for stability, grip, and long-lasting performance.';
      case 2:
        return 'High ground clearance to tackle Nepal\'s diverse terrain with confidence.';
      case 3:
        return 'Heavy-duty suspension system designed for smooth rides even with full loads.';
      case 4:
        return 'Spacious 10-foot cargo bed with 1.5-ton capacity for all your hauling needs.';
      case 5:
        return 'Fast AC/DC charging options—8-10 hours for full charge with standard charging.';
      case 6:
        return 'Compact turning radius for easy maneuvering in tight city spaces.';
      default:
        return 'Fitted with radial tires for stability, grip, and long-lasting performance.';
    }
  }

  List<Map<String, String>> _getSpecs() {
    switch (_selectedTab) {
      case 0:
        return [
          {'label': 'Power Output', 'value': '70 KW'},
          {'label': 'Torque', 'value': 'High torque'},
          {'label': 'Performance', 'value': 'Smooth acceleration'},
        ];
      case 1:
        return [
          {'label': 'Tire', 'value': 'Radial tires'},
          {'label': 'Material', 'value': 'Steel rims'},
          {'label': 'Grip', 'value': 'Strong grip'},
          {'label': 'Traction', 'value': 'Wet traction'},
          {'label': 'Life', 'value': 'Long life'},
          {'label': 'Condition', 'value': 'Nepal-ready'},
        ];
      case 2:
        return [
          {'label': 'Clearance', 'value': 'High clearance'},
          {'label': 'Terrain', 'value': 'All-terrain capable'},
        ];
      case 3:
        return [
          {'label': 'Type', 'value': 'Heavy-duty'},
          {'label': 'Load Support', 'value': 'Excellent'},
        ];
      case 4:
        return [
          {'label': 'Bed Length', 'value': '10 feet'},
          {'label': 'Load Capacity', 'value': '1.5 Tons'},
        ];
      case 5:
        return [
          {'label': 'Charging Time', 'value': '8-10 hours'},
          {'label': 'Range', 'value': '260+ km'},
        ];
      case 6:
        return [
          {'label': 'Turning Radius', 'value': 'Compact'},
          {'label': 'Maneuverability', 'value': 'Excellent'},
        ];
      default:
        return [];
    }
  }

  Widget _buildSpecItem(Map<String, String> spec) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
                    text: '${spec['label']} : ',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: spec['value'],
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

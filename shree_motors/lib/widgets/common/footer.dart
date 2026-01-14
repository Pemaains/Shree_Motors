// lib/widgets/common/footer.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/image_helper.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: 60,
      ),
      color: AppColors.secondary,
      child: Column(
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildCompanyInfo()),
                const SizedBox(width: 60),
                Expanded(child: _buildQuickLinks()),
                const SizedBox(width: 60),
                Expanded(child: _buildLatestNews()),
              ],
            )
          else
            Column(
              children: [
                _buildCompanyInfo(),
                const SizedBox(height: 40),
                _buildQuickLinks(),
                const SizedBox(height: 40),
                _buildLatestNews(),
              ],
            ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          Text(
            'Copyright 2025 © Shree Motors Kathmandu Nepal',
            style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // lib/widgets/common/footer.dart - Update _buildCompanyInfo method
  // lib/widgets/common/footer.dart - Update _buildCompanyInfo method
  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Logo Image
            Image.asset(
              ImageAssets.logo, // Use ImageAssets
              height: 150,
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.electric_car,
                    color: AppColors.white,
                    size: 24,
                  ),
                );
              },
            ),

            const SizedBox(width: 12),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Call Shree Motors Directly – Urgent EV Inquiries & Immediate Assistance',
          style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 20),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUICK LINKS',
          style: AppTextStyles.h5.copyWith(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        _buildFooterLink('Service'),
        _buildFooterLink('FAQ'),
        _buildFooterLink('About Us'),
        _buildFooterLink('Privacy policy'),
        _buildFooterLink('Support'),
        _buildFooterLink('Contact Us'),
      ],
    );
  }

  Widget _buildLatestNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LATEST NEWS',
          style: AppTextStyles.h5.copyWith(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        _buildNewsItem(
          'EV Preventive Maintenance: ...',
          'Just like traditional fuel-powered trucks ...',
          'Jul 10, 2025',
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildNewsItem(String title, String excerpt, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          excerpt,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white70,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          date,
          style: AppTextStyles.caption.copyWith(
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      children: [
        _buildSocialIcon(Icons.facebook),
        const SizedBox(width: 12),
        _buildSocialIcon(Icons.close), // Twitter/X
        const SizedBox(width: 12),
        _buildSocialIcon(Icons.add_box), // Google+
        const SizedBox(width: 12),
        _buildSocialIcon(Icons.business), // LinkedIn
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: AppColors.white),
      ),
    );
  }
}

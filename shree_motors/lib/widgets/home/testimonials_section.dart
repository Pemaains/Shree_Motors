// lib/widgets/home/testimonials_section.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../models/testimonial_model.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<TestimonialModel> _testimonials =
      TestimonialModel.getSampleTestimonials();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.padding(context),
        vertical: isMobile ? 60 : 100,
      ),
      color: AppColors.secondary,
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'TESTI',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                    color: AppColors.white,
                  ),
                ),
                TextSpan(
                  text: 'MONIALS',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: Responsive.fontSize(context, 42),
                    color: AppColors.white.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),

          // Testimonials Carousel
          SizedBox(
            height: 450,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: (_testimonials.length / (isMobile ? 1 : 3)).ceil(),
              itemBuilder: (context, pageIndex) {
                return _buildTestimonialPage(pageIndex, isMobile);
              },
            ),
          ),

          const SizedBox(height: 40),

          // Page Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (_testimonials.length / (isMobile ? 1 : 3)).ceil(),
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppColors.primary
                      : AppColors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialPage(int pageIndex, bool isMobile) {
    final itemsPerPage = isMobile ? 1 : 3;
    final startIndex = pageIndex * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, _testimonials.length);

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _buildTestimonialCard(_testimonials[startIndex]),
      );
    }

    return Row(
      children: [
        for (int i = startIndex; i < endIndex; i++) ...[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _buildTestimonialCard(_testimonials[i]),
            ),
          ),
        ],
        // Fill empty spaces
        for (int i = endIndex; i < startIndex + itemsPerPage; i++)
          const Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _buildTestimonialCard(TestimonialModel testimonial) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quote
          Container(
            constraints: const BoxConstraints(minHeight: 120),
            child: Text(
              testimonial.message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 32),

          // Profile Section
          Row(
            children: [
              // Profile Image
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                child: testimonial.imageUrl != null
                    ? ClipOval(
                        child: Image.asset(
                          testimonial.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.electric_car,
                              color: AppColors.primary,
                              size: 30,
                            );
                          },
                        ),
                      )
                    : const Icon(
                        Icons.electric_car,
                        color: AppColors.primary,
                        size: 30,
                      ),
              ),

              const SizedBox(width: 16),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.sector,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      testimonial.position,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

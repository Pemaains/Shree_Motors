// lib/models/testimonial_model.dart
class TestimonialModel {
  final String id;
  final String message;
  final String sector;
  final String company;
  final String position;
  final String? imageUrl;

  TestimonialModel({
    required this.id,
    required this.message,
    required this.sector,
    required this.company,
    required this.position,
    this.imageUrl,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      sector: json['sector'] ?? '',
      company: json['company'] ?? '',
      position: json['position'] ?? '',
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'sector': sector,
      'company': company,
      'position': position,
      'imageUrl': imageUrl,
    };
  }

  // Sample testimonials based on your design
  static List<TestimonialModel> getSampleTestimonials() {
    return [
      TestimonialModel(
        id: '1',
        message:
            'हामी हरेक दिन medical supplies लान EV प्रयोग गर्छौं — timely delivery हुन्छ, maintenance tension छैन, र driving ...',
        sector: 'HEALTHCARE & SUPPLY',
        company: 'Houzz',
        position: 'Co-Founder at Houzz',
      ),
      TestimonialModel(
        id: '2',
        message:
            'Urban delivery को लागि smart छ — quiet drive, clean energy use, र हाम्रो ग्राहकहरू पनि impressed छन्।',
        sector: 'RETAIL & DISTRIBUTION',
        company: 'Houzz',
        position: 'Co-Founder at Houzz',
      ),
      TestimonialModel(
        id: '3',
        message:
            'Farm देखि बजारसम्मको daily सामान ल्याउन Kama EV ले हाम्रो खर्च ६०% ले घटाएको छ — simple, strong, ...',
        sector: 'AGRICULTURE SECTOR',
        company: 'Houzz',
        position: 'Co-Founder at Houzz',
      ),
    ];
  }
}

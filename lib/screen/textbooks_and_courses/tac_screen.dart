import 'package:flutter/material.dart';
import 'certified_education/certified_education.dart';

class TacScreen extends StatelessWidget {
  const TacScreen({super.key});

  // Subkateqoriyaların siyahısı (hələlik sabit, sonra JSON-dan gələcək)
  final List<Map<String, String>> _subCategories = const [
    {
      'key': 'certified_education',
      'title': 'Certified Education',
    },
    {
      'key': 'free_courses',
      'title': 'Free Courses',
    },
    {
      'key': 'university_courses',
      'title': 'University Courses',
    },
    {
      'key': 'video_tutorials',
      'title': 'Video Tutorials',
    },
    {
      'key': 'interactive_learning',
      'title': 'Interactive Learning',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textbooks and Courses'),
        backgroundColor: Colors.deepPurple.shade50,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.separated(
          itemCount: _subCategories.length,
          itemBuilder: (context, index) {
            final item = _subCategories[index];
            final key = item['key'] ?? '';
            final title = item['title'] ?? '';

            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                trailing: const Text(
                  '>',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onTap: () {
                  _navigateToSubCategory(context, key);
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12.0),
        ),
      ),
    );
  }

  void _navigateToSubCategory(BuildContext context, String key) {
    switch (key) {
      case 'certified_education':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CertifiedEducationScreen(),
          ),
        );
        break;
    // Digər subkateqoriyalar üçün əlavə ediləcək
    // case 'free_courses':
    //   Navigator.push(...);
    //   break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$key - hazırlanır'),
            duration: const Duration(milliseconds: 500),
          ),
        );
    }
  }
}
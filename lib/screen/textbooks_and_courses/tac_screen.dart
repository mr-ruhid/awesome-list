import 'package:flutter/material.dart';
import 'certified_education/certified_education.dart';

class TacScreen extends StatelessWidget {
  const TacScreen({super.key});

  // Subcategory list (static for now, will be replaced by JSON data later).
  final List<Map<String, String>> _subCategories = const [
    {'key': 'certified_education', 'title': 'Certified Education'},
    {'key': 'free_courses', 'title': 'Free Courses'},
    {'key': 'university_courses', 'title': 'University Courses'},
    {'key': 'video_tutorials', 'title': 'Video Tutorials'},
    {'key': 'interactive_learning', 'title': 'Interactive Learning'},
  ];

  static const List<Color> _accentColors = [
    Color(0xFF7B2FF7),
    Color(0xFF2196F3),
    Color(0xFFFF7A18),
    Color(0xFFFF416C),
    Color(0xFF00C6FF),
  ];

  static const Map<String, IconData> _icons = {
    'certified_education': Icons.verified_rounded,
    'free_courses': Icons.school_rounded,
    'university_courses': Icons.account_balance_rounded,
    'video_tutorials': Icons.play_circle_fill_rounded,
    'interactive_learning': Icons.touch_app_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120E1B),
      appBar: AppBar(
        title: const Text(
          'Textbooks and Courses',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF120E1B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: _subCategories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14.0),
              itemBuilder: (context, index) {
                final item = _subCategories[index];
                final key = item['key'] ?? '';
                final title = item['title'] ?? '';
                final accent = _accentColors[index % _accentColors.length];
                final icon = _icons[key] ?? Icons.menu_book_rounded;

                return _SubCategoryTile(
                  title: title,
                  icon: icon,
                  accent: accent,
                  onTap: () => _navigateToSubCategory(context, key),
                );
              },
            ),
          ),
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
    // TODO: add remaining subcategory routes here.
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$key - coming soon'),
            duration: const Duration(milliseconds: 700),
            behavior: SnackBarBehavior.floating,
          ),
        );
    }
  }
}

class _SubCategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color accent;
  final VoidCallback onTap;

  const _SubCategoryTile({
    required this.title,
    required this.icon,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18.0),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(color: accent.withOpacity(0.3), width: 1.1),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accent.withOpacity(0.16), accent.withOpacity(0.04)],
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.55),
                      blurRadius: 14,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}
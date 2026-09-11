import 'package:flutter/material.dart';
import 'screen/textbooks_and_courses/tac_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  final List<String> _categoryKeys = const [
    'textbooks_and_courses',
    'coding_and_programming',
    'apps_and_tools',
    'artificial_intelligence',
    'design_and_creativity',
    'enthusiasts',
  ];

  String _translate(String key) {
    const Map<String, String> _fallbackTranslations = {
      'textbooks_and_courses': 'Textbooks and Courses',
      'coding_and_programming': 'Coding and Programming',
      'apps_and_tools': 'Apps and Tools',
      'artificial_intelligence': 'Artificial Intelligence',
      'design_and_creativity': 'Design and Creativity',
      'enthusiasts': 'Enthusiasts',
    };
    return _fallbackTranslations[key] ?? key;
  }


  _CategoryVisual _visualFor(String key) {
    switch (key) {
      case 'textbooks_and_courses':
        return _CategoryVisual(
          icon: Icons.menu_book_rounded,
          colors: const [Color(0xFF7B2FF7), Color(0xFF4A1FA0)],
        );
      case 'coding_and_programming':
        return _CategoryVisual(
          icon: Icons.code_rounded,
          colors: const [Color(0xFF2196F3), Color(0xFF0D47A1)],
        );
      case 'apps_and_tools':
        return _CategoryVisual(
          icon: Icons.widgets_rounded,
          colors: const [Color(0xFFFF7A18), Color(0xFFAF002D)],
        );
      case 'artificial_intelligence':
        return _CategoryVisual(
          icon: Icons.smart_toy_rounded,
          colors: const [Color(0xFFFF416C), Color(0xFFFF4B2B)],
        );
      case 'design_and_creativity':
        return _CategoryVisual(
          icon: Icons.palette_rounded,
          colors: const [Color(0xFFFFB347), Color(0xFFFF7300)],
        );
      case 'enthusiasts':
      default:
        return _CategoryVisual(
          icon: Icons.groups_rounded,
          colors: const [Color(0xFF00C6FF), Color(0xFF0072FF)],
        );
    }
  }

  int _crossAxisCountFor(double width) {
    if (width >= 1100) return 4;
    if (width >= 700) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120E1B),
      appBar: AppBar(
        title: const Text(
          'Knowledge Vault',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF120E1B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = _crossAxisCountFor(constraints.maxWidth);
            // Kartların çox enli olmasının qarşısını almaq üçün maks eni məhdudlaşdırırıq (web/desktop üçün vacibdir).
            final maxContentWidth = crossAxisCount >= 4 ? 1200.0 : 900.0;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: GridView.builder(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: _categoryKeys.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    final String key = _categoryKeys[index];
                    final String displayText = _translate(key);
                    final visual = _visualFor(key);

                    return _CategoryCard(
                      title: displayText,
                      icon: visual.icon,
                      gradientColors: visual.colors,
                      onTap: () => _navigateToCategory(context, key),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToCategory(BuildContext context, String key) {
    switch (key) {
      case 'textbooks_and_courses':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TacScreen(),
          ),
        );
        break;
    // case 'coding_and_programming':
    //   Navigator.push(...);
    //   break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$key - hazırlanır'),
            duration: const Duration(milliseconds: 700),
            behavior: SnackBarBehavior.floating,
          ),
        );
    }
  }
}

class _CategoryVisual {
  final IconData icon;
  final List<Color> colors;

  _CategoryVisual({required this.icon, required this.colors});
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color accent = gradientColors.first;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.0),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: accent.withOpacity(0.35),
              width: 1.2,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accent.withOpacity(0.18),
                accent.withOpacity(0.05),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -18,
                bottom: -18,
                child: Opacity(
                  opacity: 0.10,
                  child: Icon(
                    icon,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: gradientColors,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accent.withOpacity(0.6),
                            blurRadius: 18,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(icon, color: Colors.white, size: 28),
                    ),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
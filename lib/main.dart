import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knowledge Vault',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreenWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Bu wrapper geri düyməsinə basıldıqda çıxış sorğusu göstərir.
/// Bütün platformalarda (Android, iOS, Windows, macOS, Linux, Web) işləyir.
class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Geri düyməsini ələ alırıq
      onPopInvoked: (didPop) async {
        if (didPop) return; // Əgər artıq pop edilibsə, heç nə etmə

        // Çıxış dialoqunu göstər
        final bool? shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Çıxış'),
            content: const Text('Tətbiqdən çıxmaq istədiyinizə əminsiniz?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Xeyr'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Bəli'),
              ),
            ],
          ),
        );

        // Əgər istifadəçi "Bəli" seçərsə, tətbiqi bağla
        if (shouldExit == true) {
          // Bütün platformalarda tətbiqi bağlamaq üçün SystemNavigator.pop() istifadə olunur.
          // Web brauzerdə bu işləmir (səhifəni bağlamır), amma xəta da vermir.
          // Mobil (Android/iOS) və desktop (Windows/macOS/Linux) üçün işləyir.
          SystemNavigator.pop();
        }
      },
      child: const HomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Bütün platformalarda (Android, iOS, Web, macOS, Windows, Linux)
/// linkləri etibarlı şəkildə açan xidmət sinfi.
class LinkLauncher {
  /// Verilən URL-i açır. Uğursuz olarsa istifadəçiyə SnackBar xətası göstərir.
  static Future<void> launch(String url, BuildContext context) async {
    // 1. Boş linki yoxla
    if (url.isEmpty) {
      _showError(context, 'Link boşdur, zəhmət olmasa düzgün URL daxil edin.');
      return;
    }

    // 2. URL-i düzgün formata çevir (Uri)
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      _showError(context, 'Link formatı səhvdir. "https://..." şəklində olmalıdır.');
      return;
    }

    // 3. Platformadan asılı olmayaraq linki açmağa çalış
    try {
      // canLaunchUrl() - qurğunun bu linki aça biləcəyini yoxlayır
      if (await canLaunchUrl(uri)) {
        // LaunchMode.externalApplication - bütün platformalarda
        // sistemin öz brauzerini (və ya default tətbiqini) açır.
        // Web-də yeni tab açır, mobil və desktop-da xarici brauzerə yönləndirir.
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        _showError(context, 'Bu linki açmaq mümkün deyil. URL-i yoxlayın.');
      }
    } catch (e) {
      // 4. Gözlənilməz xəta (məsələn, internet yoxdur)
      _showError(context, 'Link açılarkən xəta baş verdi: $e');
    }
  }

  /// Xəta mesajlarını ekranda SnackBar ilə göstərir.
  static void _showError(BuildContext context, String message) {
    // mounted yoxlanışı – ekran hələ mövcuddursa xətanı göstər.
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }
}
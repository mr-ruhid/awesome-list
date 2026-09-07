import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Tərcümə xidməti - yalnız assets/lang/az.json faylını oxuyur.
/// Bütün mətnlər Azərbaycan dilindədir.
class TranslationService {
  static final TranslationService _instance = TranslationService._internal();
  factory TranslationService() => _instance;
  TranslationService._internal();

  // Tərcümə lüğəti: key -> value (Azərbaycan dilində)
  Map<String, String> _translations = {};

  /// JSON faylını yükləyir və _translations lüğətini doldurur.
  Future<void> loadTranslations() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/lang/az.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Map<String, dynamic> -> Map<String, String> çeviririk
      _translations = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      // Əgər JSON yüklənməzsə, boş lüğət qalır
      _translations = {};
    }
  }

  /// Verilən açarın (key) tərcüməsini qaytarır.
  /// Əgər açar tapılmazsa, özü qaytarır (fallback).
  String translate(String key) {
    return _translations[key] ?? key;
  }

  /// Bütün açarların siyahısını qaytarır.
  List<String> getKeys() {
    return _translations.keys.toList();
  }

  /// Tərcümələrin yüklənib-yüklənmədiyini yoxlayır.
  bool isLoaded() {
    return _translations.isNotEmpty;
  }
}
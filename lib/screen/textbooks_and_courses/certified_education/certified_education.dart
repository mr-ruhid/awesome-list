import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../../../services/link_launcher.dart';


class SubCategory {
  final String subCategoryId;
  final String subCategoryName;
  final List<Item> items;

  SubCategory({
    required this.subCategoryId,
    required this.subCategoryName,
    required this.items,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      subCategoryId: json['sub_category_id'] ?? '',
      subCategoryName: json['sub_category_name'] ?? '',
      items: (json['items'] as List)
          .map((item) => Item.fromJson(item))
          .toList(),
    );
  }
}

class Item {
  final String id;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final List<String> tags;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.tags,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}


class CertifiedEducationScreen extends StatefulWidget {
  const CertifiedEducationScreen({super.key});

  @override
  State<CertifiedEducationScreen> createState() =>
      _CertifiedEducationScreenState();
}

class _CertifiedEducationScreenState extends State<CertifiedEducationScreen> {
  late Future<SubCategory> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = _loadData();
  }

  Future<SubCategory> _loadData() async {
    final jsonString = await rootBundle.loadString(
      'assets/screen/textbooks_and_courses/certified_education/list.json',
    );
    final jsonMap = json.decode(jsonString);
    return SubCategory.fromJson(jsonMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SubCategory>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Xəta: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Məlumat tapılmadı'));
          }

          final subCategory = snapshot.data!;

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.deepPurple.shade50,
                width: double.infinity,
                child: Text(
                  subCategory.subCategoryName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subCategory.items.length,
                  itemBuilder: (context, index) {
                    final item = subCategory.items[index];
                    return _buildItemCard(item);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Şəkil + Başlıq (üst hissə)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Şəkil
                item.imageUrl.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.image_not_supported,
                      size: 70,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : const Icon(Icons.image, size: 70, color: Colors.grey),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: item.tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Colors.deepPurple.shade50,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  await LinkLauncher.launch(item.url, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Aç'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
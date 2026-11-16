import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../data/attractions_data.dart';
import '../widgets/attraction_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredAttractions = attractions.where((attraction) {
      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase();
      return attraction.title.toLowerCase().contains(q) ||
          attraction.location.toLowerCase().contains(q);
    }).toList();

    return Column(
      children: [
        Container(
          color: AppColors.primary,
          padding: const EdgeInsets.all(15),
          child: TextField(
            onChanged: (val) {
              setState(() {
                _searchQuery = val;
              });
            },
            decoration: InputDecoration(
              hintText: "Search attractions",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredAttractions.length,
            itemBuilder: (context, index) {
              final attraction = filteredAttractions[index];
              return AttractionCard(
                attraction: attraction,
              );
            },
          ),
        ),
      ],
    );
  }
}

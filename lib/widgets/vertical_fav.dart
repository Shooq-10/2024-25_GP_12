// ignore_for_file: avoid_unnecessary_containers

import 'package:daar/models/item_model.dart';
import 'package:daar/widgets/house_fav.dart';
import 'package:flutter/material.dart';

class VerticalRecomendList extends StatelessWidget {
  const VerticalRecomendList(this.title, this.items, {super.key});

  final String? title;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 12.0),
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling for parent
            shrinkWrap:
                true, // Allow ListView to take height based on its children
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ItemCard(
                    items[index],
                    () {}, // 
                    (item) {
                    },
                  ),
                  const SizedBox(height: 12.0), // Add space between items
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mybookstore/core/utils/texts.dart';

class FilterField extends StatelessWidget {
  final String title;
  final Widget child;
  const FilterField({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyBookStoreTextStyles.labelMedium,
          ),
          const SizedBox(width: 30),
          Expanded(child: child),
        ],
      ),
    );
  }
}

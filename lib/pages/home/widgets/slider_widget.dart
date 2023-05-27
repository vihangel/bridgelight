import 'dart:developer';

import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final Function(RangeValues) onChanged;
  const SliderWidget({super.key, required this.onChanged});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(500, 2023);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      min: 0,
      max: DateTime.now().year.toDouble(),
      divisions: 122,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        log('Selected');
        widget.onChanged(values);
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
